import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../../domain/entities/common/abstracts/drop_down_item_abs.dart';
import '../../../../domain/entities/common/drop_down_item.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/modal_action_buttons.dart';

class NewDocumentModal extends StatefulWidget {
  const NewDocumentModal({
    super.key,
    required this.formWidth,
    this.isActive = true,
    this.iconColor = const Color(0xFF9E79AC),
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final Color iconColor;

  @override
  State<NewDocumentModal> createState() => _NewDocumentModalState();
}

class _NewDocumentModalState extends State<NewDocumentModal> {
  final TextEditingController controllerDocumentCode =
      TextEditingController(text: '');

  final TextEditingController controllerSubDate =
      TextEditingController(text: '');
  final TextEditingController controllerDocumentDate =
      TextEditingController(text: '');
  final TextEditingController controllerSubNo = TextEditingController(text: '');

  final TextEditingController controllerSheetNumber =
      TextEditingController(text: '');

  final TextEditingController controllerDetailDocument =
      TextEditingController(text: '');
  final TextEditingController controllerDocumentType =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        row2(rowWidth: widget.formWidth),
        verticalGapDivider,
        row3(rowWidth: widget.formWidth),
        verticalGapDivider,
        documentTypeBox(
            width: widget.formWidth, controller: controllerDocumentType),
        verticalGapDivider,
        documentDetailBox(
            width: widget.formWidth, controller: controllerDocumentType),
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: widget.formWidth,
          formKey: widget._formKey,
          onConfirm: () {},
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
          documentCodeBox(width: itemWidth, controller: controllerDocumentCode),
          horizontalGapDivider,
          subNoBox(width: itemWidth, controller: controllerSubNo),
        ],
      ),
    );
  }

  Widget documentCodeBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDocumentCode),
        titleInputSpacing,
        FormTextField(
          textHint: '2016',
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget subNoBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleSubNo),
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

  Widget row2({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          documentDateBox(width: itemWidth, controller: controllerDocumentDate),
          horizontalGapDivider,
          subDateBox(width: itemWidth, controller: controllerSubDate),
        ],
      ),
    );
  }

  Widget documentDateBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDocumentDate),
        titleInputSpacing,
        InkWell(
          onTap: () async {
            String? selectDate = await JalaliDatePicker.getDate();
            controller.value = TextEditingValue(text: selectDate!);
          },
          child: FormTextField(
            textHint: '1403/01/18',
            controller: controller,
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: widget.iconColor,
                  size: 20,
                ),
                onPressed: () {}),
            enable: false,
            widgetWidth: width,
          ),
        ),
      ],
    );
  }

  Widget subDateBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleSubDate),
        titleInputSpacing,
        InkWell(
          onTap: () async{
            String? selectDate = await JalaliDatePicker.getDate();
            controller.value = TextEditingValue(text: selectDate!);
          },
          child: FormTextField(
            textHint: '1403/01/16',
            controller: controller,
            suffixIcon: IconButton(
                icon:  Icon(
                  Icons.calendar_month,
                  color:  widget.iconColor,
                  size: 20,
                ),
                onPressed: () {}),
            enable: false,
            widgetWidth: width,
          ),
        ),
      ],
    );
  }

  Widget row3({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          separationTypeDropBox(width: itemWidth),
          horizontalGapDivider,
          sheetNumberBox(width: itemWidth, controller: controllerSheetNumber),
        ],
      ),
    );
  }

  Widget separationTypeDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.titleSeparation1),
      DropDownItem(name: localization.titleSeparation2),
      DropDownItem(name: localization.titleSeparation3),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleSeparationType),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: widget.isActive,
          itemWidth: width - 5,
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget sheetNumberBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleSheetNumber),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget documentTypeBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDocumentType),
        titleInputSpacing,
        FormTextField(
          textHint: localization.titlePaymentNotice,
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
    );
  }

  Widget documentDetailBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDetailDocument),
        titleInputSpacing,
        FormTextField(
          textHint: 'رسید پرداخت',
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
    );
  }

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }


}
