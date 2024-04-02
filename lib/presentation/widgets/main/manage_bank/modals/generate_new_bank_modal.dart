import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item_abs.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/form_elements/form_text_field.dart';

import '../../../../../main.dart';
import '../../../common/modals/modal_elements/drop_down_generic.dart';
import '../../../common/modals/modal_elements/modal_action_buttons.dart';
import '../../forms/form_elements/form_item_title.dart';

class GenerateNewBank extends StatelessWidget {
  GenerateNewBank({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final TextEditingController bankNameController =
      TextEditingController(text: '');
  final TextEditingController branchNameController =
      TextEditingController(text: '');
  final TextEditingController branchCodeController =
      TextEditingController(text: '');
  final TextEditingController accountNumberController =
      TextEditingController(text: '');
  final TextEditingController accountOwnerController =
      TextEditingController(text: '');
  final TextEditingController cardNumberController =
      TextEditingController(text: '');
  final TextEditingController shebaNumberController =
      TextEditingController(text: '');
  final TextEditingController descriptionController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
        accountOwnerBox(width: formWidth, controller: accountOwnerController),
        verticalGapDivider,
        accountTypeDropBox(width: formWidth),
        verticalGapDivider,
        cardNumberBox(width: formWidth, controller: cardNumberController),
        verticalGapDivider,
        shebaNumberBox(width: formWidth, controller: shebaNumberController),
        verticalGapDivider,
        descriptionBox(width: formWidth, controller: descriptionController),
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: formWidth,
          formKey: _formKey,
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
          bankNameBox(width: itemWidth, controller: bankNameController),
          horizontalGapDivider,
          branchNameBox(width: itemWidth, controller: branchNameController),
        ],
      ),
    );
  }

  Widget row2({required double rowWidth}) {
    double itemWidth = getItemWidth(maxWidth: rowWidth, itemsCount: 2);
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          branchCodeBox(width: itemWidth, controller: branchCodeController),
          horizontalGapDivider,
          accountNumberBox(
              width: itemWidth, controller: accountNumberController),
        ],
      ),
    );
  }

  Widget row3({required double rowWidth}) {
    double itemWidth = (rowWidth / 2) - 12.5;
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currencyTypeDropBox(
            width: itemWidth,
          ),
          horizontalGapDivider,
          accessibilityDropBox(
            width: itemWidth,
          ),
        ],
      ),
    );
  }

  Widget bankNameBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleBankName),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: false,
          widgetWidth: width,
          suffixIcon: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
              ),
              onPressed: () {}),
        ),
      ],
    );
  }

  Widget branchNameBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleBankBranchName),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget branchCodeBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleBankBranchCode),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget accountNumberBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleAccountNumber),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
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
          isEnable: isActive,
          itemWidth: width,
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget accessibilityDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.active),
      DropDownItem(name: localization.deactivate),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleAccessibility),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: isActive,
          itemWidth: width,
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget accountOwnerBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleAccountOwner),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget accountTypeDropBox({required double width}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.titleItemCurrentAccount),
      DropDownItem(name: localization.titleItemLoanAccount),
      DropDownItem(name: localization.titleItemShortTermAccount),
      DropDownItem(name: localization.titleItemLongTermAccount),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleAccountType),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: isActive,
          itemWidth: width + 15,
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget cardNumberBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCardNumber),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget shebaNumberBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleShebaNumber),
        titleInputSpacing,
        FormTextField(
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
          controller: controller,
          enable: true,
          widgetWidth: width,
          widgetHeight: 70,
          maxLines: 3,
        ),
      ],
    );
  }
}

double getItemWidth({int itemsCount = 2, required maxWidth}) {
  return (((maxWidth) / itemsCount) - 25);
}
