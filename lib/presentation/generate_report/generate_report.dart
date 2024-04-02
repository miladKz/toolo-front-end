import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class GenerateReport {
  final String title;
  final List<IDataTreeModel> items;
  final String userFullName;
  late final ByteData fontData;

  late pdfLib.Font normalFont;

  GenerateReport({
    required this.userFullName,
    required this.title,
    required this.items,
  });


  asPdf() async {
    final img = await rootBundle.load("assets/img/icn_toolo_padideh.png");
    final imageBytes = img.buffer.asUint8List();
    pdfLib.Image imgLogo =
    pdfLib.Image(pdfLib.MemoryImage(imageBytes), height: 30);
    var now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String creteDateString = formatter.format(now);
    normalFont = pdfLib.Font.ttf(
        await rootBundle.load("assets/fonts/vazirmatn_medium.ttf"));

    final theme = pdfLib.ThemeData(
        defaultTextStyle: pdfLib.TextStyle(font: normalFont, fontSize: 14));
    final pdfLib.Document pdf = pdfLib.Document(title: title, theme: theme);
    pdf.addPage(
      pdfLib.MultiPage(
        maxPages: 10,
        pageFormat: PdfPageFormat.a4,
        textDirection: pdfLib.TextDirection.rtl,
        header: (context) {
          return pdfLib.Column(children: [
            pdfLib.Row(
                crossAxisAlignment: pdfLib.CrossAxisAlignment.center,
                mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                children: [
                  pdfLib.Container(
                    alignment: pdfLib.Alignment.centerLeft,
                    height: 30,
                    width: 48,
                    child: imgLogo,
                  ),
                  pdfLib.Container(
                      alignment: pdfLib.Alignment.centerLeft,
                      margin: const pdfLib.EdgeInsets.only(
                          top: 2.0 * PdfPageFormat.dp),
                      child: pdfLib.Text('ساخته شده توسط: $userFullName',
                          style: const pdfLib.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromInt(0xFF7B7B84),
                          ))),
                ]),
            pdfLib.SizedBox(
                height: 1, child: pdfLib.Container(color: PdfColors.grey200)),
            pdfLib.SizedBox(
              height: 20,
            ),
          ]);
        },
        footer: (context) {
          return pdfLib.Row(
              mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
              children: [
                pdfLib.Container(
                    alignment: pdfLib.Alignment.centerRight,
                    margin: const pdfLib.EdgeInsets.only(
                        top: 1.0 * PdfPageFormat.cm),
                    child: pdfLib.Text(
                      'صفحه  ${context.pageNumber} از ${context.pagesCount}',
                    )),
                pdfLib.Container(
                    alignment: pdfLib.Alignment.centerRight,
                    margin: const pdfLib.EdgeInsets.only(
                        top: 1.0 * PdfPageFormat.cm),
                    child: pdfLib.Text(
                      creteDateString,
                    )),
              ]);
        },
        build: (context) {
          return [
            pdfLib.Column(
                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                children: [
                  pdfLib.Center(
                      child: pdfLib.Text(
                        title,
                        style: const pdfLib.TextStyle(fontSize: 16),
                      )),
                  pdfLib.SizedBox(height: 20),
                  getChildren(items: items),
                ])
          ];
        },
      ),
    );
    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    html.AnchorElement(
        href:
        "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download",
          "TooloPadidehReport$creteDateString.pdf")
      ..click();
  }

  pdfLib.Widget getChildren({required List<IDataTreeModel> items}) {
    return pdfLib.Column(
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
        children: _buildChildren(items: items));
  }

  List<pdfLib.Widget> _buildChildren({
    required List<IDataTreeModel> items,
  }) {
    return items.map((item) {
      return item.hasChildren
          ? pdfLib.Column(
              crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
              mainAxisAlignment: pdfLib.MainAxisAlignment.start,
              children: [getTitle(item), getChildren(items: item.children)])
          : _buildItem(item: item);
    }).toList();
  }

  getTitle(item) {
    String text = 'Pdf _buildChildren item: ${item.displayName}';
    debugPrint(text);
    return pdfLib.Column(
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
        children: [
          pdfLib.Text('-  ${item.displayName}',
              textAlign: pdfLib.TextAlign.right,
              textDirection: pdfLib.TextDirection.rtl,
              style: const pdfLib.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(0xFF616161),
              )),
        ]);
  }

  pdfLib.Widget _buildItem({
    required IDataTreeModel item,
    double fontSize = 12,
  }) {
    debugPrint('Pdf _buildItem item: ${item.displayName}');
    return pdfLib.Padding(
        padding:
            const pdfLib.EdgeInsets.only(right: 5, left: 10, top: 2, bottom: 2),
        child: pdfLib.Text('  ${item.displayName}',
            textAlign: pdfLib.TextAlign.right,
            textDirection: pdfLib.TextDirection.rtl,
            style: pdfLib.TextStyle(
              fontSize: fontSize,
              color: const PdfColor.fromInt(0xFF7B7B84),
            )));
  }
}
