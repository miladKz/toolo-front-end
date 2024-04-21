import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/entities/common/revolving_fund.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../../domain/entities/common/abstracts/drop_down_item_abs.dart';
import '../../../../domain/entities/common/drop_down_item.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../factories/table_view_model_factory.dart';
import '../../../view_models/table_view_model.dart';
import '../snakbar.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/modal_action_buttons.dart';
import 'modal_elements/modal_opener_button.dart';

class RevolvingFundModal extends StatefulWidget {
  RevolvingFundModal({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
    required this.revolvingFund,
  }) : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final RevolvingFund revolvingFund;
  RevolvingFund? tempRevolvingFund;

  late bool isUpdate;

  @override
  State<RevolvingFundModal> createState() => _RevolvingFundModalState();
}

class _RevolvingFundModalState extends State<RevolvingFundModal> {
  final TextEditingController codeController = TextEditingController(text: '');

  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController revolvingFundLimitController =
      TextEditingController(text: '');

  final TextEditingController descriptionController =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    locator.get<MainBloc>().add(OnLoadRevolvingFundTypes());
  }
  @override
  Widget build(BuildContext context) {
    print("startBuild");
    checkSate();
    widget.isUpdate = (widget.revolvingFund.id > 0);

    if (widget.isUpdate) {
      copyRevolvingFundToTempRevolvingFund();
      codeController.text = widget.revolvingFund.code.toString();
      nameController.text = widget.revolvingFund.name;
      //todo: set currect field to limit currency
      revolvingFundLimitController.text =
          widget.revolvingFund.detailId.toString();
      descriptionController.text = widget.revolvingFund.description;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        codeBox(width: widget.formWidth, controller: codeController),
        verticalGapDivider,
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        nameBox(width: widget.formWidth, controller: nameController),
        verticalGapDivider,
        row2(rowWidth: widget.formWidth),
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
            int code;
            try {
              code = int.parse(codeController.text);
            } on FormatException {
              code = 0;
            }

            widget.revolvingFund.updateCode(code);
            widget.revolvingFund.updateName(nameController.text);
            widget.revolvingFund.updateDescription(descriptionController.text);

            if (widget.isUpdate) {
              locator
                  .get<MainBloc>()
                  .add(OnUpdateCounterparty(widget.revolvingFund));
            } else {
              locator
                  .get<MainBloc>()
                  .add(OnCreateCounterparty(widget.revolvingFund));
            }
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
          accessDropBox(width: itemWidth),
          horizontalGapDivider,
          currencyTypeDropBox(width: itemWidth),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          revolvingFundTypeModalOpenerButton(width: itemWidth),
          horizontalGapDivider,
          revolvingFundLimit(
              width: itemWidth, controller: revolvingFundLimitController),
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
          value: widget.revolvingFund.isActive ? items[0] : items[1],
          items: items,
          onChanged: (value) {
            if (value != null) {
              widget.revolvingFund
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

    int selectedIndex = items.indexWhere((item) {
      //todo: put correct field in below code
      return item.name
          .toLowerCase()
          .contains(widget.revolvingFund.type.toString());
    });

    if (selectedIndex == -1) {
      selectedIndex = 0; // Set a default index
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleCurrencyType),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: widget.isActive,
          itemWidth: width - 5,
          value: items[selectedIndex],
          items: items,
          onChanged: (value) {
            if (value != null) {
              //todo: set Correct Field
              widget.revolvingFund
                  .updateIsActive(value.name == localization.active);
            }
          },
        ),
      ],
    );
  }

  Widget revolvingFundTypeModalOpenerButton({required double width}) {
    String value = (widget.isUpdate) ? getRevolvingFundTypeName() : '';
    DataTableViewModel? dataTableViewModel;
    MainBloc mainBloc = locator.get<MainBloc>();
    if (mainBloc.standardDetailList != null) {
      dataTableViewModel =
          DataTableViewModelFactory.createTableViewModelFromStandardDetailList(
              mainBloc.standardDetailList!);
    }
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
          value: value,
          formKey: widget._formKey,
          onSelectItemFromTableModal: (revolvingFoundType) {
            if (revolvingFoundType != null) {
              try {
                StandardDetail standardDetail =
                revolvingFoundType as StandardDetail;
                widget.revolvingFund.type = standardDetail.id;
              } catch (e) {
                debugPrint("cast failed: $e");
              }
            }
          },
          dataTableViewModel: dataTableViewModel,
        ),
      ],
    );
  }

  Widget revolvingFundLimit(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.revolvingFundLimit),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          inputType: TextInputType.number,
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

  void copyRevolvingFundToTempRevolvingFund() {
    widget.tempRevolvingFund =
        RevolvingFund(counterparty: widget.revolvingFund.copy());
  }

  String getRevolvingFundTypeName() {
    String revolvingFundName = '';
    MainBloc mainBloc = locator.get<MainBloc>();
    if (mainBloc.standardDetailList != null) {
      for (StandardDetail standardDetail in mainBloc.standardDetailList!) {
        if (widget.revolvingFund.type == standardDetail.id) {
          revolvingFundName = standardDetail.description;
        }
      }
    }

    return revolvingFundName;
  }

  void checkSate() {
    final mainBloc = context.watch<MainBloc>();
    final state = mainBloc.state;

    if (state is LoadedStandardDetails) {
      mainBloc.standardDetailList = state.standardDetailList;
    } else if (state is SuccessUpdateCounterparty ||
        state is SuccessCreateCounterparty) {
      Navigator.of(context).pop();
    } else if (state is FailedUpdateCounterparty) {
      debugPrint('generate counterpartyBank error: ${state.errorMessage}');
      //Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is FailedCreateCounterparty) {
      debugPrint('generate counterpartyBank error: ${state.errorMessage}');
      // Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    }
  }
}
