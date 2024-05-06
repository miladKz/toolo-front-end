import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/common/card_reader.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/presentation/factories/table_view_model_factory.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../../di/di.dart';
import '../../../../domain/entities/common/abstracts/drop_down_item_abs.dart';
import '../../../../domain/entities/common/bank.dart';
import '../../../../domain/entities/common/drop_down_item.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../snakbar.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/modal_action_buttons.dart';
import 'modal_elements/modal_opener_button.dart';

class CardReaderModal extends StatefulWidget {
  CardReaderModal(
      {super.key,
      required this.formWidth,
      this.isActive = true,
      required GlobalKey<FormState> formKey,
      required this.cardReader})
      : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final CardReader cardReader;
  CardReader? tempCardReader;
  late Bank bankList;
  bool isShowProgress = false;
  late bool isUpdate;

  @override
  State<CardReaderModal> createState() => _CardReaderModalState();
}

class _CardReaderModalState extends State<CardReaderModal> {
  final TextEditingController codeController = TextEditingController(text: '');

  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController terminalNumberController =
      TextEditingController(text: '');

  final TextEditingController descriptionController =
      TextEditingController(text: '');
  bool currencyTypeDropBoxVisibility = false;
  late Widget relatedBankModalOpenerButtonInstance = RelatedBankWidget(
    formWidth: widget.formWidth,
    formKey: widget._formKey,
    currencyTypeName: getCurrencyTypeName(),
    relatedBankName: getRelatedBankName(),
    onSelectItem: (selectedBank) {
      widget.cardReader.updateBankId(selectedBank.id);
      widget.cardReader.updateCurrencyType(selectedBank.currencyType);
    },
  );

  @override
  Widget build(BuildContext context) {
    checkState();
    widget.isUpdate = (widget.cardReader.id != 0);
    codeController.text =
        widget.isUpdate ? widget.cardReader.code.toString() : '';
    nameController.text =
        widget.isUpdate ? widget.cardReader.name.toString() : '';
    terminalNumberController.text =
        widget.isUpdate ? widget.cardReader.nationalCode.toString() : '';
    descriptionController.text =
        widget.isUpdate ? widget.cardReader.description : '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        nameBox(width: widget.formWidth, controller: nameController),
        verticalGapDivider,
        terminalNumberBox(
            width: widget.formWidth, controller: terminalNumberController),
        verticalGapDivider,
        relatedBankModalOpenerButtonInstance,
        verticalGapDivider,
        descriptionBox(
            width: widget.formWidth, controller: descriptionController),
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: widget.formWidth,
          formKey: widget._formKey,
          onConfirm: () {
            //   if (widget._formKey.currentState != null &&
            //     widget._formKey.currentState!.validate()) {
            int code;
            try {
              code = int.parse(codeController.text);
            } on FormatException {
              code = 0;
            }
            widget.cardReader.updateCode(code);
            widget.cardReader.updateName(nameController.text);

            int terminalCode;
            try {
              terminalCode = int.parse(terminalNumberController.text);
            } on FormatException {
              terminalCode = 0;
            }
            widget.cardReader.updateNationalCode(terminalCode.toString());

            widget.cardReader.updateDescription(descriptionController.text);
            if (widget.isUpdate) {
              locator
                  .get<MainBloc>()
                  .add(OnUpdateCounterparty(widget.cardReader));
            } else {
              locator
                  .get<MainBloc>()
                  .add(OnCreateCounterparty(widget.cardReader));
            }
            //  }
          },
        )
      ],
    );
  }

  Widget row1({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          codeBox(width: itemWidth, controller: codeController),
          horizontalGapDivider,
          accessDropBox(width: itemWidth),
        ],
      ),
    );
  }

  Widget codeBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.code),
        titleInputSpacing,
        FormTextField(
          textHint: localization.automaticSelection,
          controller: controller,
          enable: false,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget accessDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.active),
      DropDownItem(name: localization.deactivate),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.access),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: widget.isActive,
          itemWidth: width - 5,
          value: widget.cardReader.isActive ? items[0] : items[1],
          //isNew ? items[0] : widget.cardReader.isActive,
          items: items,
          onChanged: (value) {
            if (value != null) {
              widget.cardReader
                  .updateIsActive(value.name == localization.active);
            }
          },
        ),
      ],
    );
  }

  Widget nameBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.name),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget terminalNumberBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.terminalNumber),
        titleInputSpacing,
        FormTextField(
          inputType: TextInputType.number,
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget descriptionBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.description),
        titleInputSpacing,
        FormTextField(
          textHint: localization.textWritten,
          controller: controller,
          enable: true,
          widgetWidth: width,
          widgetHeight: 90,
          maxLines: 4,
        ),
      ],
    );
  }

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }

  void copyCounterpartyToTempCounterparty() {
    widget.tempCardReader = CardReader(counterparty: widget.cardReader.copy());
  }

  void checkState() {
    final state = context.watch<MainBloc>().state;
    if (state is MainLoadingOnButton) {
      setState(() {
        widget.isShowProgress = state.isShow;
      });
    } else if (state is SuccessUpdateCounterparty ||
        state is SuccessCreateCounterparty) {
      Navigator.of(context).pop();
    } else if (state is FailedUpdateCounterparty) {
      debugPrint('editGroup error: ${state.errorMessage}');
      Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is FailedCreateCounterparty) {
      debugPrint('createGroup error: ${state.errorMessage}');
      Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    }
  }

  String getRelatedBankName() {
    String bankName = '';
    for (Counterparty counterparty in baseDataModel.counterpartyBankList) {
      if (widget.cardReader.parentId == counterparty.id) {
        bankName = counterparty.name;
      }
    }
    if (bankName.isNotEmpty) {
      currencyTypeDropBoxVisibility = true;
    }
    return bankName;
  }

  String getCurrencyTypeName() {
    String currencyTypeName = '';
    for (CurrencyType currencyType in baseDataModel.currencyTypeList) {
      if (widget.cardReader.currencyType == currencyType.id) {
        currencyTypeName = currencyType.name;
      }
    }
    return currencyTypeName;
  }
}

class RelatedBankWidget extends StatefulWidget {
  RelatedBankWidget(
      {super.key,
      required this.formWidth,
      required this.currencyTypeName,
      required this.formKey,
      required this.relatedBankName,
      required this.onSelectItem});

  double formWidth;

  final GlobalKey<FormState> formKey;
  Function(Counterparty) onSelectItem;
  String relatedBankName;
  String currencyTypeName;

  @override
  State<RelatedBankWidget> createState() => _RelatedBankWidgetState();
}

class _RelatedBankWidgetState extends State<RelatedBankWidget> {
  bool currencyTypeDropBoxVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        relatedBankModalOpenerButton(width: widget.formWidth),
        verticalGapDivider,
        if (currencyTypeDropBoxVisibility || widget.currencyTypeName.isNotEmpty) ...[
          currencyTypeField(width: widget.formWidth)
        ],
      ],
    );
  }

  Widget relatedBankModalOpenerButton({required double width}) {
    DataTableViewModel dataTableViewModel =
        DataTableViewModelFactory.createTableViewModelFromBankAccTypeList(
            baseDataModel.counterpartyBankList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.relatedBank),
        titleInputSpacing,
        ModalOpenerButton(
          dialogTitle: localization.titleBankList,
          buttonWidth: width,
          formWidth: widget.formWidth - 200,
          value: widget.relatedBankName,
          formKey: widget.formKey,
          onSelectItemFromTableModal: (bank) {
            if (bank != null) {
              try {
                Counterparty bankCounterparty = bank as Counterparty;
                widget.onSelectItem(bankCounterparty);
                setState(() {
                  widget.relatedBankName = bank.name;
                  currencyTypeDropBoxVisibility = true;
                });
              } catch (e) {
                setState(() {
                  currencyTypeDropBoxVisibility = false;
                });
              }
            }
          },
          dataTableViewModel: dataTableViewModel,
        ),
      ],
    );
  }

  Widget currencyTypeField({required double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCurrencyType),
        titleInputSpacing,
        FormTextField(
          inputType: TextInputType.number,
          textHint: widget.currencyTypeName,
          enable: false,
          widgetWidth: width,
        ),
      ],
    );
  }
}
