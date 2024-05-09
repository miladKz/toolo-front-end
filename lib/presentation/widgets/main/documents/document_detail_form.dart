import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_total_price_param_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/tafzili_data.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

class DocumentDetailForm extends StatelessWidget {
  final double width;
  final double maxHeight;
  DocumentMasterDetail? documentDetail;
  final DocumentMaster masterDoc;

  DocumentDetailForm({
    super.key,
    required this.width,
    required this.masterDoc,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountingDocumentDataWidget(width: width, masterDoc: masterDoc),
            const SizedBox(
              height: 10,
            ),
            CurrentDocumentDetailWidget(
                width: width, docDetail: documentDetail),
          ],
        ),
      ),
    );
  }
}

class AccountingDocumentDataWidget extends StatelessWidget {
  final double width;
  final DocumentMaster masterDoc;

  const AccountingDocumentDataWidget(
      {super.key, required this.width, required this.masterDoc});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 20,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        //color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ExpandedAccountingDocumentWidget(
            width: width, masterDoc: masterDoc),
      ),
    );
  }
}

class CurrentDocumentDetailWidget extends StatefulWidget {
  final double width;
  DocumentMasterDetail? docDetail;

  CurrentDocumentDetailWidget({super.key, required this.width, this.docDetail});

  @override
  State<CurrentDocumentDetailWidget> createState() =>
      _CurrentDocumentDetailWidgetState();
}

class _CurrentDocumentDetailWidgetState
    extends State<CurrentDocumentDetailWidget> {
  @override
  Widget build(BuildContext context) {
    listenToDocDetailData();
    return widget.docDetail == null
        ? const SizedBox()
        : Container(
            constraints: BoxConstraints(
              minHeight: 20,
              maxWidth: widget.width,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              //color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ExpandedCurrentDocumentDataWidget(
                  width: widget.width, docDetail: widget.docDetail!),
            ),
          );
  }

  void listenToDocDetailData() {
    final state = context.watch<DocDetailBloc>().state;
    if (state is UpdateDocumentDetailData) {
      setState(() {
        widget.docDetail = state.documentMasterDetail;
      });
    }
  }
}

class ExpandedAccountingDocumentWidget extends StatefulWidget {
  final double width;
  final DocumentMaster masterDoc;

  const ExpandedAccountingDocumentWidget({
    super.key,
    required this.width,
    required this.masterDoc,
  });

  @override
  State<ExpandedAccountingDocumentWidget> createState() =>
      _ExpandedAccountingDocumentWidgetState();
}

class _ExpandedAccountingDocumentWidgetState
    extends State<ExpandedAccountingDocumentWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8D7DA),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Icon(
                          _isExpanded ? Icons.remove : Icons.add,
                          color: const Color(0xffDC3545),
                          size: 12,
                        ),
                      ),
                    ),
                    horizontalGapDivider,
                    FormItemTitle(
                      title: localization.titleAccountingDocument,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: const Color(0xff4F4F4F),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 1,
                color: const Color(0xffEFEFF4),
              )
            ],
          ),
          accountingDocumentData(width: widget.width, height: 30)
              .visible(_isExpanded),
        ],
      ),
    );
  }

  Widget accountingDocumentData({required double width, required int height}) {
    final List<Widget> items = [
      item(
          title: localization.titleDocumentCode,
          value: widget.masterDoc.number),
      item(
          title: localization.titleSaveType,
          value: widget.masterDoc.saveTypeName),
      item(
          title: localization.titleDocumentDate,
          value: widget.masterDoc.persianDate),
      item(
          title: localization.titleDocumentDetail,
          value: widget.masterDoc.description),
      item(
          title: localization.titleReferenceCode,
          value: widget.masterDoc.number2),
      item(
          title: localization.titleSubDate,
          value: widget.masterDoc.dateBargeCustom),
      item(
          title: localization.titleSubNo, value: widget.masterDoc.numberCustom),
      item(
          title: localization.titleDailyNumber,
          value: widget.masterDoc.numberDaily),
      item(
          title: localization.titleMonthlyNumber,
          value: widget.masterDoc.numberMonthly),
      item(
          title: localization.titleSeparationType,
          value: widget.masterDoc.categoryName),
      item(
          title: localization.titleDocumentStatus,
          value: widget.masterDoc.isActive
              ? localization.active
              : localization.deactivate),
      item(
          title: localization.titleDocumentType,
          value: widget.masterDoc.bargeTypeName),
      item(
          title: localization.titleSheetNumber,
          value: widget.masterDoc.numberBarge),
    ];

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              childAspectRatio: (width / height),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              children: items,
            ),
            verticalGapDivider,
            totalPriceBox(maxWidth: width),
          ],
        ),
      ),
    );
  }

  Widget item({required String title, required dynamic value}) {
    const TextStyle titleStile = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    const TextStyle valueTextStile = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          FormItemTitle(
            title: '$title:',
            style: titleStile,
          ),
          horizontalGapDivider,
          Flexible(
            child: FormItemTitle(
              title: '$value',
              maxLine: 1,
              style: valueTextStile,
            ),
          ),
        ],
      ),
    );
  }

  Widget totalPriceBox({required double maxWidth}) {
    final param = DocumentTotalPriceParamDto(
        voucherMSID: widget.masterDoc.id, articleID: 0);
    locator
        .get<DocDetailBloc>()
        .add(DocFetchDocumentDetailTotalPrice(param: param));
    return PriceAmountBox(maxWidth: maxWidth);
  }
}

class PriceAmountBox extends StatefulWidget {
  final double maxWidth;
  DocumentTotalPrice? documentTotalPrice;

  PriceAmountBox({super.key, required this.maxWidth});

  @override
  State<PriceAmountBox> createState() => _PriceAmountBoxState();
}

class _PriceAmountBoxState extends State<PriceAmountBox> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = widget.maxWidth * 0.4;
    listenToUpdatePrice();
    return widget.documentTotalPrice == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
          decoration: BoxDecoration(
              color: const Color(0xff929292).withOpacity(0.25),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      item(
                          title: localization.titleDebtorSum,
                          value: widget.documentTotalPrice!.bedTotalPrice
                              .abs(),
                          width: itemWidth),
                      item(
                          title: localization.titleCreditorSum,
                          value: widget.documentTotalPrice!.besTotalPrice
                              .abs(),
                          width: itemWidth),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: const Color(0xff6C3483),
                ),
                item(
                    title: localization.titleRemaining,
                    value: widget.documentTotalPrice!.totalPrice,
                    width: itemWidth),
              ],
            ),
          ),
        );
  }

  Widget item(
      {required String title, required dynamic value, required double width}) {
    const TextStyle titleStyle = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    const TextStyle valueTextStyle = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    return Container(
     constraints: BoxConstraints(maxWidth: width),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormItemTitle(
            title: '$title:',
            style: titleStyle,
          ),
          horizontalGapDivider,
          Flexible(
            child: FormItemTitle(
              title: '$value',
              maxLine: 1,
              style: valueTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  void listenToUpdatePrice() {
    final state = context.watch<DocDetailBloc>().state;
    if (state is SuccessFetchDocumentTotalPrice) {
      setState(() {
        widget.documentTotalPrice = state.documentTotalPrice;
      });
    }
  }
}

class ExpandedCurrentDocumentDataWidget extends StatefulWidget {
  final double width;
  final DocumentMasterDetail docDetail;

  const ExpandedCurrentDocumentDataWidget({
    super.key,
    required this.width,
    required this.docDetail,
  });

  @override
  State<ExpandedCurrentDocumentDataWidget> createState() =>
      _ExpandedCurrentDocumentDataWidgetState();
}

class _ExpandedCurrentDocumentDataWidgetState
    extends State<ExpandedCurrentDocumentDataWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8D7DA),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Icon(
                          _isExpanded ? Icons.remove : Icons.add,
                          color: const Color(0xffDC3545),
                          size: 12,
                        ),
                      ),
                    ),
                    horizontalGapDivider,
                    FormItemTitle(
                      title:
                          '${localization.accountCode}:  ${widget.docDetail.accountcd}-${widget.docDetail.accountsDescription}',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: const Color(0xff4F4F4F),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 1,
                color: const Color(0xffEFEFF4),
              )
            ],
          ),
          documentData(width: widget.width, height: 30).visible(_isExpanded),
        ],
      ),
    );
  }

  Widget documentData({required double width, required int height}) {
    List<Widget> tafziliItems = List.empty(growable: true);
    for (TafziliData tafziliItem in widget.docDetail.tafziliDataList) {
      tafziliItems.add(item(
          title: tafziliItem.tafziliGroupName, value: tafziliItem.tafziliName));
    }

    final List<Widget> items = [
      item(
          title: localization.groupName,
          value: widget.docDetail.accountsGroupName),
      item(
          title: localization.titleTotal,
          value: widget.docDetail.accountsKolName),
      ...tafziliItems,
    ];
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        childAspectRatio: (width / height) * 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
        crossAxisCount: 1,
        children: items,
      ),
    );
  }

  Widget item({required String title, required dynamic value}) {
    const TextStyle titleStile = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    const TextStyle valueTextStile = TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          FormItemTitle(
            title: '$title:',
            style: titleStile,
          ),
          horizontalGapDivider,
          Flexible(
            child: FormItemTitle(
              title: '$value',
              maxLine: 1,
              style: valueTextStile,
            ),
          ),
        ],
      ),
    );
  }
}
