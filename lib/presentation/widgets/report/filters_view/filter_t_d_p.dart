import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/params/balance_and_ledgers_param.dart';
import 'package:toolo_gostar/domain/entities/base/category.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/custom_title_on_border.dart';
import 'package:toolo_gostar/presentation/widgets/common/get_tafzili_from_account_widget.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/check_box_form.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/drop_down_generic.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/radio_button_list.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/report/advance_filter_button.dart';
import 'package:toolo_gostar/presentation/widgets/report/btn_set_filter.dart';

class FilterTDPView extends StatelessWidget {
  final double height = 70;
  final double inputHeight = 70;
  final Function(dynamic) onChangeFilter;

  const FilterTDPView({super.key, required this.onChangeFilter});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: AdvanceFiltersButton(
            height: height,
            body:  Filters(
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

  TextEditingController controllerFromDocument = TextEditingController(text: '1');
  TextEditingController controllerToDocument = TextEditingController(text: '100');
  TextEditingController controllerFromDate = TextEditingController(text: '1403/02/01');
  TextEditingController controllerToDate = TextEditingController(text: '1403/02/30');
  TextEditingController controllerDocumentCode = TextEditingController(text: '');
  TextEditingController controllerDocCodDesc = TextEditingController(text: '');
  TextEditingController controllerFromReference = TextEditingController(text: '1');
  TextEditingController controllerToReference = TextEditingController(text: '100');
  TextEditingController controllerSeparation = TextEditingController(text: '');
  TextEditingController controllerGroup = TextEditingController(text: '');
  TextEditingController controllerTarazType = TextEditingController(text: '');
  TextEditingController controllerDisplayColumnNumber = TextEditingController(text: '2');
  List<FormCheckBox> checkBoxList = List.empty(growable: true);

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
            const SizedBox(
              height: 6,
            ),
            column1(width: width),
            const SizedBox(
              height: 6,
            ),
            column2(width: width),
            verticalGapDivider,
            showListCheckBox(width: width),
            BtnSetFilter(
                width: width,
                onTap: () {
                  BalanceAndLedgersParam body = getFilterBody();
                  locator.get<ReportBloc>().add(RepFetchRepostTDP(body: body));
                }),
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
            itemWidth: itemWidth,
            hint: '',
            controller: controllerSeparation),
      ],
    );
  }

  Widget separationItem(
      {required double itemWidth,
      required TextEditingController controller,
      required String hint}) {
    List<CategoryModel> items= baseDataModel.categoryList;
    controllerSeparation.text = '${ items[0].id}';
    return GenericDropDown<CategoryModel>(
      isEnable: true,
      itemWidth: itemWidth,
      value: items[0],
      items: items,
      hint: hint,
      onChanged: (value) {
        controllerSeparation.text = '${value?.id}';
        //controller.value=TextEditingValue(text: value.toString());
      },
    );
  }

  Widget column1({required double width}) {
    final List<String> radioButtonTitle = [
      localization.balanceGroup,
      localization.balanceAll,
      localization.balanceCertain,
      localization.balanceTafziliSabet1,
      localization.balanceTafziliSabet2,
    ];
    return SizedBox(
      width: width,
      child: Column(
        children: [
          linearTitle(title: localization.balanceType),
          verticalGapDivider,
          CustomGridRadioButtonList(
              width: width,
              height: height,
              radioButtonTitle: radioButtonTitle,
              values: const [0, 1, 2, 3, 4],
              controller: controllerTarazType),
        ],
      ),
    );
  }

  Widget column2({required double width}) {
    final List<String> radioButtonTitle = [
      localization.titleDisplayStyleCol2,
      localization.titleDisplayStyleCol4,
      localization.titleDisplayStyleCol6,
      localization.titleDisplayStyleCol8,
    ];
    return SizedBox(
      width: width,
      child: Column(
        children: [
          linearTitle(title: localization.titleDisplayStyle),
          verticalGapDivider,
          CustomGridRadioButtonList(
              width: width,
              height: height,
              radioButtonTitle: radioButtonTitle,
              values: const [2, 4, 6, 8],
              controller: controllerDisplayColumnNumber),
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

  Widget showListCheckBox({required double width}) {
    final List<String> checkBoxNames = [
      localization.titleOpeningDocument,
      localization.titleClosingDocument,
      localization.titleCurrencyExchangeDocument,
      localization.titleTemporaryAccountClosingDocument,
      localization.titleHesabEntezami,
      localization.titleOnlyInCirculation,
      localization.titleOnlyLeftovers,
      localization.titleOnlyDebitBalances,
      localization.titleOnlyCreditorBalances,
      localization.profitAndLoss,
      localization.titleHamrahZirSath,
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

  List<FormCheckBox> getCheckBoxList(List<String> checkBoxName) {
    for (String title in checkBoxName) {
      checkBoxList.add(FormCheckBox(value: true, title: title));
    }

    return checkBoxList;
  }

  BalanceAndLedgersParam getFilterBody() {
    int accountLevel = controllerTarazType.text.toInt();
    String fromDate = controllerFromDate.text;
    String toDate = controllerToDate.text;
    String accountCd = controllerDocumentCode.text;
    int fromNumber = controllerFromDocument.text.toInt();
    int toNumber = controllerToDocument.text.toInt();
    int fromNumber2 = controllerFromReference.text.toInt();
    int toNumber2 = controllerToReference.text.toInt();
    int categoryId = controllerSeparation.text.toInt();
    int displayColumn = controllerDisplayColumnNumber.text.toInt();
    bool withEftetahie = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleOpeningDocument);
    bool withEkhtetamieh = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleClosingDocument);
    bool withTasir = getCheckBoxValue(
        checkBoxList: checkBoxList,
        title: localization.titleCurrencyExchangeDocument);
    bool withBastanHesabhayeMovaqat = getCheckBoxValue(
        checkBoxList: checkBoxList,
        title: localization.titleTemporaryAccountClosingDocument);
    bool withEntezamiAccounts = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleHesabEntezami);
    bool withFaqatGardeshDarha = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleOnlyInCirculation);
    bool withFaqatMandeDarha = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleOnlyLeftovers);
    bool withFaqatMandeDarhayeBed = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleOnlyDebitBalances);
    bool withFaqatMandeDarhayeBes = getCheckBoxValue(
        checkBoxList: checkBoxList,
        title: localization.titleOnlyCreditorBalances);
    bool withSoodZian = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.profitAndLoss);
    bool withZirSath = getCheckBoxValue(
        checkBoxList: checkBoxList, title: localization.titleHamrahZirSath);

    BalanceAndLedgersParam body=   BalanceAndLedgersParam(
        activeYear: 0,
        fromDate: fromDate,
        toDate: toDate,
        accountCd: accountCd,
        fromNumber: fromNumber,
        toNumber: toNumber,
        fromNumber2: fromNumber2,
        toNumber2: toNumber2,
        categoryId: categoryId,
        saveTypeId: 0,
        accountLevel: accountLevel,
        displayColumn: displayColumn,
        withEftetahie: withEftetahie,
        withEkhtetamieh: withEkhtetamieh,
        withTasir: withTasir,
        withSoodZian: withSoodZian,
        withZirSath: withZirSath,
        withBastanHesabhayeMovaqat: withBastanHesabhayeMovaqat,
        withEntezamiAccounts: withEntezamiAccounts,
        withFaqatGardeshDarha: withFaqatGardeshDarha,
        withFaqatMandeDarha: withFaqatMandeDarha,
        withFaqatMandeDarhayeBed: withFaqatMandeDarhayeBed,
        withFaqatMandeDarhayeBes: withFaqatMandeDarhayeBes);
    return body;
  }

  bool getCheckBoxValue(
      {required List<FormCheckBox> checkBoxList, required String title}) {
    final FormCheckBox? formCheckBox = checkBoxList.firstWhereOrNull(
        (element) => element.title == localization.titleOpeningDocument);
    if (formCheckBox != null) {
      return formCheckBox.value;
    } else {
      return false;
    }
  }
}
