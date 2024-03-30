import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class GenerateReport {
  final String title;
  final List<IDataTreeModel> items;

  late final ByteData fontData;

  late pdfLib.Font normalFont;

  GenerateReport({
    required this.title,
    required this.items,
  });

  asPdf() async {

    normalFont =pdfLib.Font.ttf(await rootBundle.load("assets/fonts/vazirmatn_medium.ttf"));

    final theme = pdfLib.ThemeData(
        defaultTextStyle:
            pdfLib.TextStyle(font: normalFont, fontSize: 14));
    final pdfLib.Document pdf = pdfLib.Document(title: title,);
    pdf.addPage(
      pdfLib.Page(
        textDirection: pdfLib.TextDirection.rtl,
        build: (context) {
          return pdfLib.Column(
              crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
              mainAxisAlignment: pdfLib.MainAxisAlignment.start,
              children: [
                pdfLib.Center(child: pdfLib.Text('Toolo Gostar Report',)),
                getChildren(items: items),
              ]);
        },
      ),
    );
    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    html.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download",
          "TooloGostarAccountReport${DateTime.now().millisecondsSinceEpoch}.pdf")
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
              style: pdfLib.TextStyle(
                font: normalFont,
                fontSize: 16,
                color: const PdfColor.fromInt(0xFF616161),
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
              font: normalFont,
              color: const PdfColor.fromInt(0xFF7B7B84),
            )));
  }
}
