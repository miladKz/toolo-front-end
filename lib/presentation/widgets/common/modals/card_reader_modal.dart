import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/card_reader.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../../di/di.dart';
import '../../../../domain/entities/common/abstracts/drop_down_item_abs.dart';
import '../../../../domain/entities/common/drop_down_item.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../main/forms/form_elements/form_item_title.dart';
import '../../main/forms/form_elements/form_text_field.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/modal_action_buttons.dart';

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

  late Widget relatedBankDropBoxInstance =
      relatedBankDropBox(width: widget.formWidth);

  @override
  Widget build(BuildContext context) {
    bool isUpdate = (widget.cardReader.id != -1);
    codeController.text = isUpdate ? widget.cardReader.code.toString() : '';
    nameController.text = isUpdate ? widget.cardReader.name.toString() : '';
    terminalNumberController.text =
        isUpdate ? widget.cardReader.detailId.toString() : '';
    descriptionController.text = isUpdate ? widget.cardReader.description : '';

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
        relatedBankDropBoxInstance,
        verticalGapDivider,
        if (currencyTypeDropBoxVisibility) ...[
          currencyTypeDropBox(width: widget.formWidth)
        ],
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

            int bankId;
            try {
              bankId = int.parse(terminalNumberController.text);
            } on FormatException {
              bankId = 0;
            }
            widget.cardReader.updateDetailCode(terminalCode);
            //todo:  widget.cardReader.updateBankId();
            widget.cardReader.updateDescription(descriptionController.text);
            if (isUpdate) {
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
                  .updateIsActive(value!.name == localization.active);
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

  Widget relatedBankDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: ''),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.relatedBank),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: widget.isActive,
          itemWidth: width - 29,
          value: items[0],
          items: items,
          onChanged: (value) {
            setState(() {
              currencyTypeDropBoxVisibility =
                  (value != null && value.name.isNotEmpty);
            });
          },
        ),
      ],
    );
  }

  Widget currencyTypeDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.titleItemCurrencyRial),
      DropDownItem(name: localization.titleItemCurrencyUSDollar),
      DropDownItem(name: localization.titleItemCurrencyEuro),
      DropDownItem(name: localization.titleItemCurrencyPound),
      DropDownItem(name: localization.titleItemCurrencyAED),
      DropDownItem(name: localization.titleItemCurrencyTurkishLira),
      DropDownItem(name: localization.titleItemCurrencySwedishKrona),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCurrencyType),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: widget.isActive,
          itemWidth: width - 29,
          value: items[0],
          items: items,
          onChanged: (value) {},
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
    widget.tempCardReader = widget.cardReader.copy();
  }
}
