import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolo_gostar/domain/entities/base/category.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/custom_title_on_border.dart';
import 'package:toolo_gostar/presentation/widgets/common/get_tafzili_from_account_widget.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/check_box_form.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/drop_down_generic.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/radio_button_list.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/report/advance_filter_button.dart';

TextEditingController controllerFromDocument = TextEditingController();
TextEditingController controllerToDocument = TextEditingController();
TextEditingController controllerFromDate = TextEditingController();
TextEditingController controllerToDate = TextEditingController();
TextEditingController controllerDocumentCode = TextEditingController();
TextEditingController controllerDocCodDesc = TextEditingController();
TextEditingController controllerFromReference = TextEditingController();
TextEditingController controllerToReference = TextEditingController();
TextEditingController controllerSeparation = TextEditingController();
TextEditingController controllerGroup = TextEditingController();
TextEditingController controllerRadioButton = TextEditingController();

class FilterTTShView extends StatelessWidget {
  final double height = 70;
  final double inputHeight = 70;
  final Function(dynamic) onChangeFilter;

  const FilterTTShView({super.key, required this.onChangeFilter});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: AdvanceFiltersButton(
            height: height,
            body: Filters(
              height: 70,
            ),
          ),
        );
      },
    );
  }
}

class Filters extends StatelessWidget {
  Filters({super.key, required this.height});

  final double height;

  TextStyle get getFilterBodyTitleStyle => const TextStyle(
      color: Color(0xff69696A), fontSize: 10, fontWeight: FontWeight.w700);

  TextStyle get getFilterBodyStyle => const TextStyle(
      color: Color(0xff69696A), fontSize: 10, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return Column(
          children: [
            baseFilterTitle(
                title: localization.titleDocument,
                body: row1(width: width),
                width: width,
                height: height),
            baseFilterTitle(
                title: localization.titleDate,
                body: row2(width: width),
                width: width,
                height: height),
            baseFilterTitle(
                title: localization.accountCode,
                body: GetTafziliFromAccountWidget(
                    controllerDocumentCode: controllerDocumentCode,
                    controllerDocCodDesc: controllerDocCodDesc),
                width: width,
                height: height),
            baseFilterTitle(
                title: localization.titleReference,
                body: row3(width: width),
                width: width,
                height: height),
            baseFilterTitle(
                title: localization.titleSeparation,
                body: row4(width: width),
                width: width,
                height: height),
            baseFilterTitle(
                title: localization.reportBasedOn,
                body: row5(width: width),
                width: width,
                height: height),
            const SizedBox(
              height: 6,
            ),
            column1(width: width),
            verticalGapDivider,
            linearGap,
            verticalGapDivider,
            showListCheckBox(width: width),
          ],
        );
      },
    );
  }

  Widget baseFilterTitle(
      {required String title,
      required Widget body,
      required double width,
      double height = 80}) {
    return CustomTitleOnBorder(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(8),
      title: title,
      body: Center(child: body),
    );
  }

  smallFilterDivider() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 2, top: 6, bottom: 6),
        child: SizedBox(
          width: 1,
          height: height * 0.4,
          child: Container(
            color: const Color(0xffEFEFEF),
          ),
        ),
      ),
    );
  }

  largeFilterDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 3, top: 4, bottom: 4),
      child: SizedBox(
        width: 1,
        height: height * 0.7,
        child: Container(
          color: const Color(0xffECECEC),
        ),
      ),
    );
  }

  Widget row1({required double width}) {
    final double itemWidth = (width / 2) - 50;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        documentItem(
            itemWidth: itemWidth,
            title: localization.titleFromDocument,
            hint: '1',
            controller: controllerFromDocument),
        largeFilterDivider(),
        documentItem(
            itemWidth: itemWidth,
            title: localization.titleToDocument,
            hint: '999',
            controller: controllerToDocument),
      ],
    );
  }

  Widget documentItem(
      {required double itemWidth,
      required String title,
      required TextEditingController controller,
      required String hint}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: getFilterBodyTitleStyle,
        ),
        smallFilterDivider(),
        SizedBox(
          width: itemWidth,
          child: TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: getFilterBodyStyle,
                contentPadding: const EdgeInsets.only(right: 2, left: 2)),
            maxLines: 1,
            controller: controller,
            style: getFilterBodyStyle,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
          ),
        )
      ],
    );
  }

  Widget row2({required double width}) {
    final double itemWidth = (width / 2) - 50;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        dateItem(
            itemWidth: itemWidth,
            title: localization.titleFromDate,
            hint: '1401/01/01',
            controller: controllerFromDate),
        largeFilterDivider(),
        dateItem(
            itemWidth: itemWidth,
            title: localization.titleToDate,
            hint: '1401/2/16',
            controller: controllerToDate),
      ],
    );
  }

  Widget dateItem(
      {required double itemWidth,
      required String title,
      required TextEditingController controller,
      required String hint}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: getFilterBodyTitleStyle,
        ),
        smallFilterDivider(),
        SizedBox(
          width: itemWidth,
          child: InkWell(
            onTap: () async {
              String? selectDate = await JalaliDatePicker.getDate();
              controller.value = TextEditingValue(text: selectDate!);
            },
            child: TextFormField(
              enabled: false,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: getFilterBodyStyle,
                  contentPadding: const EdgeInsets.only(right: 2, left: 2)),
              maxLines: 1,
              controller: controller,
              style: getFilterBodyStyle,
              keyboardType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget row3({required double width}) {
    final double itemWidth = (width / 2) - 50;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        referenceItem(
            itemWidth: itemWidth,
            title: localization.titleFromReference,
            hint: '1',
            controller: controllerFromReference),
        largeFilterDivider(),
        referenceItem(
            itemWidth: itemWidth,
            title: localization.titleToReference,
            hint: '999',
            controller: controllerToReference),
      ],
    );
  }

  Widget referenceItem(
      {required double itemWidth,
      required String title,
      required TextEditingController controller,
      required String hint}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: getFilterBodyTitleStyle,
        ),
        smallFilterDivider(),
        SizedBox(
          width: itemWidth,
          child: TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: getFilterBodyStyle,
                contentPadding: const EdgeInsets.only(right: 2, left: 2)),
            maxLines: 1,
            controller: controller,
            style: getFilterBodyStyle,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
          ),
        )
      ],
    );
  }

  Widget row4({required double width}) {
    final double itemWidth = width - 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        separationItem(
            itemWidth: itemWidth, hint: '', controller: controllerSeparation),
      ],
    );
  }

  Widget separationItem(
      {required double itemWidth,
      required TextEditingController controller,
      required String hint}) {
    List<CategoryModel> items = baseDataModel.categoryList;
    return GenericDropDown<CategoryModel>(
      isEnable: true,
      itemWidth: itemWidth,
      value: items[0],
      items: items,
      hint: hint,
      onChanged: (value) {
        //controller.value=TextEditingValue(text: value.toString());
      },
    );
  }

  Widget row5({required double width}) {
    final double itemWidth = width - 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        groupItem(
            itemWidth: itemWidth, hint: '', controller: controllerGroup),
      ],
    );
  }

  Widget groupItem(
      {required double itemWidth,
      required TextEditingController controller,
      required String hint}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.floating1),
      DropDownItem(name: localization.floating2),
      DropDownItem(name: localization.floating3),
    ];
    return GenericDropDown<IDropDownItem>(
      isEnable: true,
      itemWidth: itemWidth,
      value: items[0],
      items: items,
      hint: hint,
      onChanged: (value) {
        //controller.value=TextEditingValue(text: value.toString());
      },
    );
  }

  Widget column1({required double width}) {
    final List<String> radioButtonTitle = [
      localization.titleDisplayStyleCol2,
      localization.titleDisplayStyleCol4,
      localization.titleDisplayStyleCol8,
      localization.titleDisplayStyleCol10,
    ];
    return SizedBox(
      width: width,
      child: Column(
        children: [
          linearTitle(title: localization.titleDisplayStyle),
          CustomGridRadioButtonList(
              width: width,
              height: height,
              radioButtonTitle: radioButtonTitle,
              controller: controllerRadioButton),
        ],
      ),
    );
  }

  Row linearTitle({required String title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            title,
            style: getFilterBodyTitleStyle.copyWith(
                color: const Color(0xffA7A7A7)),
          ),
        ),
        Expanded(
            child: Container(
          height: 1,
          color: const Color(0xffCCCCCC),
        ))
      ],
    );
  }

  Widget linearGap = Container(
    height: 1,
    color: const Color(0xffCCCCCC),
  );

  Widget showListCheckBox({required double width}) {
    final List<String> checkBoxNames = [
      localization.titleOpeningDocument,
      localization.titleClosingDocument,
      localization.titleCurrencyExchangeDocument,
      localization.titleTemporaryAccountClosingDocument,
      localization.titleAutomaticSizeAdjustment,
      localization.titleOnlyInCirculation,
      localization.titleOnlyLeftovers,
      localization.titleOnlyDebitBalances,
      localization.titleOnlyDebitBalances,
    ];
    double maxWidth = width;
    double itemWidth = maxWidth / 2;
    double itemHeight = 48;
    return SizedBox(
      width: maxWidth,
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        childAspectRatio: (itemWidth / itemHeight),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        crossAxisCount: 2,
        children: getCheckBoxList(checkBoxNames),
      ),
    );
  }

  List<Widget> getCheckBoxList(List<String> checkBoxName) {
    List<Widget> widgets = List.empty(growable: true);
    for (String title in checkBoxName) {
      widgets.add(FormCheckBox(value: true, title: title));
    }

    return widgets;
  }
}
