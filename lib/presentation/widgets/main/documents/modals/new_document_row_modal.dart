import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/data/models/accounting/document/body/create_document_detail_body_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/body/document_detail_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/body/tafzili_data_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_and_child.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_child.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/snakbar.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/main/account_have_tafzili_group_modal.dart';

import '../../../../../../main.dart';
import '../../../common/modals/modal_elements/modal_action_buttons.dart';

class NewDocumentRowModal extends StatefulWidget {
  NewDocumentRowModal({
    super.key,
    required this.formWidth,
    this.isActive = true,
    this.iconColor = const Color(0xFF9E79AC),
    required GlobalKey<FormState> formKey,
    required this.onCreateOrUpdateStatus,
    required this.voucherMSID,
  }) : _formKey = formKey;
  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final int voucherMSID;
  final Color iconColor;
  final Function(bool isSuccess) onCreateOrUpdateStatus;

  int accountID = 0;
  final TextEditingController controllerDocumentCode =
      TextEditingController(text: '');

  final TextEditingController controllerDocCodDesc =
      TextEditingController(text: '');

  final TextEditingController controllerSheetNumber =
      TextEditingController(text: '');

  final TextEditingController controllerDetailDocument =
      TextEditingController(text: '');
  final TextEditingController controllerArticle =
      TextEditingController(text: '0');
  final TextEditingController controllerAmount =
      TextEditingController(text: '0');

  final TextEditingController controllerCreditorCurrencyAmount =
      TextEditingController(text: '0');

  final TextEditingController controllerDebtorCurrencyAmount =
      TextEditingController(text: '0');

  final TextEditingController controllerExchangeParity =
      TextEditingController(text: '0');
  final TextEditingController controllerExchangeRate =
      TextEditingController(text: '0');
  final TextEditingController controllerDebtorAmount =
      TextEditingController(text: '0');
  final TextEditingController controllerCreditorAmount =
      TextEditingController(text: '0');

  @override
  State<NewDocumentRowModal> createState() => _NewDocumentRowModalState();
}

class _NewDocumentRowModalState extends State<NewDocumentRowModal> {
  final List<TextEditingController> controllersTafzili =
      List.empty(growable: true);

  List<TafziliDataBody> tafziliDataBodyList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {


    listenToCreateDoc(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        TafziliDetailRow(
            rowWidth: widget.formWidth,
            controllersTafzili: controllersTafzili,
            tafziliDataBodyList: tafziliDataBodyList),
        documentDetailBox(
            width: widget.formWidth,
            controller: widget.controllerDetailDocument),
        verticalGapDivider,
        row6(
          rowWidth: widget.formWidth,
        ),
        verticalGapDivider,
        row7(
          rowWidth: widget.formWidth,
        ),
        verticalGapDivider,
        row8(
          rowWidth: widget.formWidth,
        ),
        verticalGapDivider,
        row9(
          rowWidth: widget.formWidth,
        ),
        verticalGapDivider,
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: widget.formWidth,
          formKey: widget._formKey,
          onConfirm: () {
            CreateDocumentDetailBodyDto createDocumentDetailBodyDto =
                getCreateDocumentDetailBody();
            locator
                .get<DocDetailBloc>()
                .add(DocCreateDocumentDetail(param: createDocumentDetailBodyDto));
          },
        ),
      ],
    );
  }

  CreateDocumentDetailBodyDto getCreateDocumentDetailBody() {
    tafziliDataBodyList =
        updateTafziliData(controllersTafzili: controllersTafzili);
    double mablagh = getMablagh(
        controllerDebtorAmount: widget.controllerDebtorAmount,
        controllerCreditorAmount: widget.controllerCreditorAmount);
    double arzMablagh = getArzMablagh(
        controllerDebtorCurrencyAmount: widget.controllerDebtorCurrencyAmount,
        controllerCreditorCurrencyAmount:
            widget.controllerCreditorCurrencyAmount);
    DocumentDetailBody documentDetailBody = DocumentDetailBody(
        voucherMSID: widget.voucherMSID,
        rowNumber: 0,
        article: widget.controllerArticle.text.toInt(),
        accountID: widget.accountID,
        mablagh: mablagh,
        description: widget.controllerDetailDocument.text,
        arzRowNumber: 1,
        arzMablagh: arzMablagh,
        nerkhBarabari: widget.controllerExchangeParity.text.toInt(),
        value1: widget.controllerAmount.text.toInt());

    CreateDocumentDetailBodyDto createDocumentDetailBodyDto =
        CreateDocumentDetailBodyDto(
            documentDetailBody: documentDetailBody,
            tafziliDataBodyList: tafziliDataBodyList);

    return createDocumentDetailBodyDto;
  }

  Widget row1({required double rowWidth}) {
    return SizedBox(
      width: rowWidth,
      child: AccountCodeObject(
        rowWidth: rowWidth,
        controllerDocumentCode: widget.controllerDocumentCode,
        controllerDocCodDesc: widget.controllerDocCodDesc,
        onAccountSelect: (accountItem) {
          widget.accountID = accountItem.id;
        },
      ),
    );
  }

  Widget documentFloatingDetailDescBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: ''),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }


  Widget documentDetailBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDocumentDetail),
        titleInputSpacing,
        FormTextField(
          textHint: localization.titlePaymentNotice,
          controller: controller,
          enable: true,
          suffixIcon: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
              ),
              onPressed: () {}),
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget row6({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          articleBox(width: itemWidth, controller: widget.controllerArticle),
          horizontalGapDivider,
          amountBox(width: itemWidth, controller: widget.controllerAmount),
        ],
      ),
    );
  }

  Widget articleBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleArticle),
        titleInputSpacing,
        FormTextField(
          textHint: '1',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget amountBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: '${localization.value}1'),
        titleInputSpacing,
        FormTextField(
          textHint: '58',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget row7({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          debtorCurrencyAmountBox(
              width: itemWidth,
            controller: widget.controllerDebtorCurrencyAmount,
            onEditingComplete: () {
              widget.controllerCreditorCurrencyAmount.text = '0';
            },
          ),
          horizontalGapDivider,
          creditorCurrencyAmountBox(
              width: itemWidth,
            controller: widget.controllerCreditorCurrencyAmount,
            onEditingComplete: () {
              widget.controllerDebtorCurrencyAmount.text = '0';
            },
          ),
        ],
      ),
    );
  }

  Widget debtorCurrencyAmountBox(
      {required double width,
      required TextEditingController controller,
      VoidCallback? onEditingComplete}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDebtorCurrencyAmount),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  Widget creditorCurrencyAmountBox(
      {required double width,
      required TextEditingController controller,
      VoidCallback? onEditingComplete}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCreditorCurrencyAmount),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  Widget row8({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          exchangeParityBox(
              width: itemWidth, controller: widget.controllerExchangeParity),
          horizontalGapDivider,
          exchangeRateBox(
              width: itemWidth, controller: widget.controllerExchangeRate),
        ],
      ),
    );
  }

  Widget exchangeParityBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleExchangeParity),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget exchangeRateBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCurrencyAmount),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget row9({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          debtorAmountBox(
            width: itemWidth,
            controller: widget.controllerDebtorAmount,
            onEditingComplete: () {
              widget.controllerCreditorAmount.text = '0';
            },
          ),
          horizontalGapDivider,
          creditorAmountBox(
            width: itemWidth,
            controller: widget.controllerCreditorAmount,
            onEditingComplete: () {
              widget.controllerDebtorAmount.text = '0';
            },
          ),
        ],
      ),
    );
  }

  Widget debtorAmountBox(
      {required double width,
      required TextEditingController controller,
      VoidCallback? onEditingComplete}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDebtorAmount),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  Widget creditorAmountBox(
      {required double width,
      required TextEditingController controller,
      VoidCallback? onEditingComplete}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCreditorAmount),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: true,
          widgetWidth: width,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }

  List<TafziliDataBody> updateTafziliData(
      {required List<TextEditingController> controllersTafzili}) {
    for (int i = 0; i < tafziliDataBodyList.length; i++) {
      tafziliDataBodyList[i].updateTafziliId(
          tafziliID: int.parse(controllersTafzili[i].value.text));
    }
    return tafziliDataBodyList;
  }

  void listenToCreateDoc(BuildContext context) async{
    final state = context.watch<DocDetailBloc>().state;
    if (state is CreateDocumentDetailStatus) {
      Navigator.of(context).pop();
      await Future.delayed(const Duration(milliseconds: 20));
      widget.onCreateOrUpdateStatus(state.isSuccess);
      if (!state.isSuccess) {
        Future.delayed(const Duration(microseconds: 20)).then((value) =>
            showSnack(
                title: localization.errorTitle,
                message: "create doc master error"));
      }
    }
  }
}

class TafziliDetailRow extends StatefulWidget {
  final double rowWidth;
  List<TextEditingController> controllersTafzili;
  List<TafziliDataBody> tafziliDataBodyList;
  List<TafziliGroupAndChildren> tafziliGroupAndChildren =
      List.empty(growable: true);

  TafziliDetailRow(
      {super.key,
      required this.rowWidth,
      required this.controllersTafzili,
      required this.tafziliDataBodyList});

  @override
  State<TafziliDetailRow> createState() => _TafziliDetailRowState();
}

class _TafziliDetailRowState extends State<TafziliDetailRow> {
  @override
  Widget build(BuildContext context) {
    listenToTafziliDataFetch();
    return SizedBox(
        width: widget.rowWidth,
        child: Column(
          children: getChildren(),
        )).visible(widget.tafziliGroupAndChildren.isNotEmpty);
  }

  List<Widget> getChildren() {
    widget.controllersTafzili.clear();
    widget.tafziliDataBodyList.clear();
    List<Widget> widgetList = List.empty(growable: true);
    for (TafziliGroupAndChildren item in widget.tafziliGroupAndChildren) {
      TextEditingController controller = TextEditingController(text: '');
      widget.controllersTafzili.add(controller);
      widget.tafziliDataBodyList
          .add(TafziliDataBody(tafziliGroupID: item.id, tafziliID: -1));
      double itemWidth = (((widget.rowWidth) / 2) - 25);
      widgetList.add(
        tafziliItem(
            itemWidth: widget.rowWidth, controller: controller, item: item),
      );
      widgetList.add(verticalGapDivider);
    }
    return widgetList;
  }

  Widget tafziliItem(
      {required double itemWidth,
      required TextEditingController controller,
      required TafziliGroupAndChildren item}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: item.name),
        titleInputSpacing,
        TafziliDropBox(
          itemWidth: itemWidth,
          childItems: item.tafziliList,
          controller: TextEditingController(text: ''),
          onSelectItem: (item) {
            debugPrint(
                'Tafzili onSelectItem: name= ${item.name} and id= ${item.id}');
            controller.value = TextEditingValue(text: '${item.id}');
          },
        ),
      ],
    );
  }

  void listenToTafziliDataFetch() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessFetchTafziliGroupAndChildList) {
      setState(() {
        widget.tafziliGroupAndChildren = state.items;
      });
    }
  }
}

class TafziliDropBox extends StatefulWidget {
  final List<TafziliGroupChild> childItems;
  final TextEditingController controller;
  final Function(TafziliGroupChild) onSelectItem;
  final double itemWidth;

  TafziliDropBox(
      {super.key,
      required this.childItems,
      required this.controller,
      required this.onSelectItem,
      required this.itemWidth});

  @override
  State<TafziliDropBox> createState() => _TafziliDropBoxState();
}

class _TafziliDropBoxState extends State<TafziliDropBox> {
  TafziliGroupChild? selectedValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: widget.itemWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<TafziliGroupChild>(
                  iconStyleData: const IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                      ),
                    ),
                    iconSize: 16,
                  ),
                  alignment: atrasAlignment(context),
                  isExpanded: true,
                  hint: FormItemTitle(title: ""),
                  items: widget.childItems.map((item) {
                    return DropdownMenuItem(
                      enabled: true,
                      alignment: atrasAlignment(context),
                      value: item,
                      child: FormItemTitle(title: '${item.code}-${item.name}'),
                    );
                  }).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      widget.onSelectItem(value!);
                      selectedValue = value;
                    });
                  },
                  underline: const SizedBox(),
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 40,
                    width: widget.itemWidth,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: widget.itemWidth,
                    maxHeight: double.infinity,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: widget.controller,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                            right: 4, top: 4, left: 4, bottom: 2),
                        child: FormTextField(
                          textHint: localization.searchIn,
                          controller: widget.controller,
                        )),
                    searchMatchFn: (item, searchValue) {
                      return item.value!.name.contains(searchValue);
                    },
                  ),
                  //This to clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      widget.controller.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountCodeObject extends StatefulWidget {
  final double rowWidth;
  final TextEditingController controllerDocumentCode;
  final TextEditingController controllerDocCodDesc;
  final Function(AccountHaveTafziliGroup) onAccountSelect;
  const AccountCodeObject(
      {super.key,
      required this.rowWidth,
      required this.controllerDocumentCode,
      required this.controllerDocCodDesc,
      required this.onAccountSelect});

  @override
  State<AccountCodeObject> createState() => _AccountCodeObjectState();
}

class _AccountCodeObjectState extends State<AccountCodeObject> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (((widget.rowWidth) / 2) - 25);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        documentCodeBox(
            width: itemWidth, controller: widget.controllerDocumentCode),
        horizontalGapDivider,
        documentCodeDescBox(
            width: itemWidth, controller: widget.controllerDocCodDesc),
      ],
    );
  }

  Widget documentCodeBox(
      {required double width, required TextEditingController controller}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            //double formWidth = MediaQuery.of(context).size.width;
            double formWidth = 800;
            return CustomDialog(
              title: localization.titleNewRow,
              width: formWidth,
              body: AccountHaveTafziliGroupModal(
                onSelected: (AccountHaveTafziliGroup accountItem) {
                  widget.onAccountSelect(accountItem);
                  debugPrint(
                      'AccountHaveTafziliGroupModal: ${accountItem.displayName}');

                  widget.controllerDocumentCode.value =
                      TextEditingValue(text: accountItem.accountcd);
                  widget.controllerDocCodDesc.value =
                      TextEditingValue(text: accountItem.description);
                  Navigator.of(context).pop();
                  locator.get<MainBloc>().add(
                      MainFetchTafziliGroupAndChildListWithAccountId(
                          accountId: accountItem.id));
                },
              ),
            ); // Pass your account data here
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormItemTitle(title: localization.accountCode),
          titleInputSpacing,
          FormTextField(
            textHint: '66',
            controller: controller,
            enable: false,
            suffixIcon: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                ),
                onPressed: () {}),
            widgetWidth: width,
          ),
        ],
      ),
    );
  }

  Widget documentCodeDescBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: ''),
        titleInputSpacing,
        FormTextField(
          textHint: '0',
          controller: controller,
          enable: false,
          widgetWidth: width,
        ),
      ],
    );
  }
}

double getMablagh(
    {required TextEditingController controllerDebtorAmount,
    required TextEditingController controllerCreditorAmount}) {
  double debAmount = controllerDebtorAmount.text.isEmpty
      ? 0
      : controllerDebtorAmount.text.toDouble();
  double creditorAmount = controllerCreditorAmount.text.isEmpty
      ? 0
      : controllerCreditorAmount.text.toDouble();

  return debAmount > 0 ? debAmount : (creditorAmount>0?(creditorAmount * -1):0);
}

double getArzMablagh(
    {required TextEditingController controllerDebtorCurrencyAmount,
    required TextEditingController controllerCreditorCurrencyAmount}) {
  double debAmount = controllerDebtorCurrencyAmount.text.isEmpty
      ? 0
      : controllerDebtorCurrencyAmount.text.toDouble();
  double creditorAmount = controllerCreditorCurrencyAmount.text.isEmpty
      ? 0
      : controllerCreditorCurrencyAmount.text.toDouble();

  return (debAmount > 0 ? debAmount : (creditorAmount>0?(creditorAmount * -1):0));
}
