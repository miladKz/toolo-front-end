import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/custom_title_on_border.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/check_box_form.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/drop_down_generic.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/radio_button_list.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';


TextEditingController controllerFromDocument=TextEditingController();
TextEditingController controllerToDocument=TextEditingController();
TextEditingController controllerFromDate=TextEditingController();
TextEditingController controllerToDate=TextEditingController();
TextEditingController controllerFromReference=TextEditingController();
TextEditingController controllerToReference=TextEditingController();
TextEditingController controllerSeparation=TextEditingController();
TextEditingController controllerGroup=TextEditingController();
TextEditingController controllerRadioButton=TextEditingController();
class ReportFilter extends StatelessWidget {
  final double width = 300;
  final double height = 70;

  const ReportFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdvanceFiltersButton(width: width, height: height),
        verticalGapDivider,
        Filters(
          width: width,
          height: height,
        ),
      ],
    );
  }
}

class AdvanceFiltersButton extends StatefulWidget {
  AdvanceFiltersButton({super.key, required this.width, required this.height});

  final double width;
  final double height;

  bool isExpand = false;

  @override
  State<AdvanceFiltersButton> createState() => _AdvanceFiltersButtonState();
}

class _AdvanceFiltersButtonState extends State<AdvanceFiltersButton> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration baseDecoration = BoxDecoration(
        color: const Color(0xffF9FAFB), borderRadius: BorderRadius.circular(5));
    return InkWell(
      onTap: () {
        setState(() {
          widget.isExpand = !widget.isExpand;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: baseDecoration,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: baseDecoration.copyWith(color: const Color(0xffEFE0F5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localization.titleAdvanceFilter,
                style: const TextStyle(
                    color: Color(0xff616161),
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                widget.isExpand
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: const Color(0xff616161),
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({super.key, required this.width, required this.height});

  final double width;
  final double height;

  TextStyle get getFilterBodyTitleStyle => const TextStyle(
      color: Color(0xff69696A), fontSize: 10, fontWeight: FontWeight.w700);

  TextStyle get getFilterBodyStyle => const TextStyle(
      color: Color(0xff69696A), fontSize: 10, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              title: localization.titleGroup,
              body: row5(width: width),
              width: width,
              height: height),
          const SizedBox(
            height: 6,
          ),
          column1(width: width)
        ],
      ),
    );
  }

  Widget baseFilterTitle(
      {required String title,
      required Widget body,
      required double width,
      required double height}) {
    return CustomTitleOnBorder(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(8),
      title: title,
      body: body,
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
            itemWidth: itemWidth,
            hint: 'بدون تفکیک',
            controller: controllerSeparation),
      ],
    );
  }

  Widget separationItem(
      {required double itemWidth,
      required TextEditingController controller,
      required String hint}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.titleSeparation1),
      DropDownItem(name: localization.titleSeparation2),
      DropDownItem(name: localization.titleSeparation3)
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

  Widget row5({required double width}) {
    final double itemWidth = width - 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        groupItem(
            itemWidth: itemWidth,
            hint: 'اشخاص',
            controller: controllerGroup),
      ],
    );
  }

  Widget groupItem(
      {required double itemWidth,
      required TextEditingController controller,
      required String hint}) {
    List<DropDownItem> items = [
      DropDownItem(name: localization.titlePersonnel),
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
          titleDisplay(),
          verticalGapDivider,
          CustomGridRadioButtonList(
              width: width,
              height: height,
              radioButtonTitle: radioButtonTitle,
              controller: controllerRadioButton),
          verticalGapDivider,
          showListCheckBox(width: width),
        ],
      ),
    );
  }

  Row titleDisplay() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            localization.titleDisplayStyle,
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
    double itemHeight = 40;
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

/*
class RadioButtonList extends StatefulWidget {
  final double width;
  final double height;
  int selectedRadio = 0;

  RadioButtonList({super.key, required this.width, required this.height});

  @override
  State<RadioButtonList> createState() => _RadioButtonListState();
}

class _RadioButtonListState extends State<RadioButtonList> {
  @override
  Widget build(BuildContext context) {

    double maxWidth = widget.width;
    return SizedBox(
      width: maxWidth,
      height: widget.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: (widget.width / widget.height) + 2,
        ),
        itemCount: radioButtonNames.length,
        itemBuilder: (context, index) {
          return RadioButtonForm(
            title: radioButtonNames[index],
            index: index,
            selectedRadio: widget.selectedRadio,
            onChanged: (int value) {
              setState(() {
                widget.selectedRadio = value;
              });
            },
          );
        },
      ),
    );
  }
}
*/
