import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/data/models/accounting/document/body/create_document_master_body_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/base/category.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/snakbar.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../../main.dart';
import '../../../common/modals/modal_elements/drop_down_generic.dart';
import '../../../common/modals/modal_elements/modal_action_buttons.dart';

class CreateOrUpdateDocumentMasterModal extends StatelessWidget {
  CreateOrUpdateDocumentMasterModal.create({
    super.key,
    required this.formWidth,
    required GlobalKey<FormState> formKey,
    this.iconColor = const Color(0xFF9E79AC),
    required this.onCreateOrUpdateStatus,
  }) {
    _formKey = formKey;
    isCreate = true;
    bargeTypeId = -1;
    documentMaster=null;
  }

  CreateOrUpdateDocumentMasterModal.update({
    super.key,
    required this.formWidth,
    required GlobalKey<FormState> formKey,
    this.iconColor = const Color(0xFF9E79AC),
    required this.onCreateOrUpdateStatus,
    required this.documentMaster,
  }) {
    _formKey = formKey;
    isCreate = false;
    bargeTypeId=documentMaster!.bargeTypeID;
  }

  final double formWidth;
  late final GlobalKey<FormState> _formKey;
  final Color iconColor;
  late final int bargeTypeId;
  late final bool isCreate;
 late final DocumentMaster? documentMaster;
  final Function(bool isSuccess) onCreateOrUpdateStatus;
  CategoryModel? categoryModel;
  final TextEditingController controllerDocumentCode =
  TextEditingController(text: '');

  final TextEditingController controllerSubNo = TextEditingController(text: '');

  final TextEditingController controllerDocumentDate =
  TextEditingController(text: '');

  final TextEditingController controllerSubDate =
  TextEditingController(text: '');

  final TextEditingController controllerCategory =
  TextEditingController(text: '');

  final TextEditingController controllerSheetNumber =
  TextEditingController(text: '');

  final TextEditingController controllerDetailDocument =
  TextEditingController(text: '');

  final TextEditingController controllerDocumentType =
  TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (!isCreate) {
      if (documentMaster != null) {
        initControllers(documentMaster!);
      }
    }
    listenToCreateDoc(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(rowWidth: formWidth),
        verticalGapDivider,
        row2(rowWidth: formWidth),
        verticalGapDivider,
        row3(rowWidth: formWidth),
        verticalGapDivider,
        documentTypeBox(
            width: formWidth, controller: controllerDocumentType),
        verticalGapDivider,
        documentDetailBox(
            width: formWidth, controller: controllerDetailDocument),
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: formWidth,
          formKey: _formKey,
          onConfirm: () {
            CreateDocumentMasterBodyDto documentMasterBodyDto =
            getDocumentMasterBodyDto();
            locator
                .get<MainBloc>()
                .add(MainCreateDocumentMaster(documentMasterBodyDto));
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
                  color: iconColor,
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
          onTap: () async {
            String? selectDate = await JalaliDatePicker.getDate();
            controller.value = TextEditingValue(text: selectDate!);
          },
          child: FormTextField(
            textHint: '1403/01/16',
            controller: controller,
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: iconColor,
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
    List<CategoryModel> items = baseDataModel.categoryList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleSeparationType),
        titleInputSpacing,
        GenericDropDown<CategoryModel>(
          isEnable: true,
          itemWidth: width - 5,
          value:categoryModel ?? items[0],
          items: items,
          onChanged: (value) {
            controllerCategory.value =
                TextEditingValue(text: value!.id.toString());
          },
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
    List<DocumentType> items = baseDataModel.documentTypeList;
    bool isEnable = bargeTypeId < 0;
    DocumentType? currentType = items.firstWhereOrNull((element) => element.id==bargeTypeId);
    DocumentType value = currentType??items[0];
    controllerDocumentType.value = TextEditingValue(text: value.id.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDocumentType),
        titleInputSpacing,
        GenericDropDown<DocumentType>(
          isEnable: isEnable,
          itemWidth: width - 5,
          value: value,
          items: items,
          onChanged: (value) {
            controllerDocumentType.value =
                TextEditingValue(text: value!.id.toString());
          },
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
          textHint: controller.text,
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

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }

  CreateDocumentMasterBodyDto getDocumentMasterBodyDto() {
    int categoryID = int.parse(controllerCategory.text);
    int docCode = controllerDocumentCode.text.isEmpty
        ? 0
        : int.parse(controllerDocumentCode.text);
    int numberCustom = int.parse(controllerSubNo.text);
    String dateBarge = controllerDocumentDate.text;
    String description = controllerDetailDocument.text;
    String dateBargeCustom = controllerSubDate.text;

    int bargeTypeID = int.parse(controllerDocumentType.text);
    int bargeNumber = int.parse(controllerSheetNumber.text);
    return CreateDocumentMasterBodyDto(
        categoryID: categoryID,
        number2: docCode,
        numberCustom: numberCustom,
        dateBarge: JalaliDatePicker.convertJalaliToGregorian(dateAsStr: dateBarge),
        description: description,
        dateBargeCustom:JalaliDatePicker.convertJalaliToGregorian(dateAsStr: dateBargeCustom) ,
        bargeTypeID: bargeTypeID,
        numberBarge: bargeNumber,
        comment: '');
  }

  void listenToCreateDoc(BuildContext context) {
    final state = context
        .watch<MainBloc>()
        .state;
    if (state is CreateDocumentMasterStatus) {
      onCreateOrUpdateStatus(state.isSuccess);
      Navigator.of(context).pop();
      if (!state.isSuccess) {
        Future.delayed(const Duration(microseconds: 20)).then((value) =>
            showSnack(
                title: localization.errorTitle,
                message: "create doc master error"));
      }
    }
  }

  void initControllers(DocumentMaster documentMaster) {
    setValueToController(controllerDocumentCode, documentMaster.number2);
    setValueToController(controllerSubNo, documentMaster.numberCustom);
    setValueToController(controllerDocumentDate, documentMaster.persianDate);
    setValueToController(controllerSubDate, documentMaster.dateBargeCustom);
    categoryModel=baseDataModel.categoryList.firstWhereOrNull((element) => element.id==documentMaster.categoryID);
    setValueToController(controllerCategory, documentMaster.categoryID);


    setValueToController(controllerSheetNumber, documentMaster.numberBarge);
    setValueToController(controllerDocumentType, documentMaster.bargeTypeName);
    setValueToController(controllerDetailDocument, documentMaster.description);
  }

  setValueToController(TextEditingController controller, dynamic value) {
    controller.value = TextEditingValue(text: '$value');
  }
}
