import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/domain/entities/base/available_bank_.dart';
import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/common/bank.dart';
import '../../../../../main.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';
import '../../../../factories/table_view_model_factory.dart';
import '../../../../view_models/table_view_model.dart';
import '../../../common/modals/modal_elements/drop_down_generic.dart';
import '../../../common/modals/modal_elements/modal_action_buttons.dart';
import '../../../common/modals/modal_elements/modal_opener_button.dart';
import '../../../common/snakbar.dart';

class GenerateNewBank extends StatefulWidget {
  GenerateNewBank({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
    required this.bank,
  }) : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final Bank bank;

  bool isShowProgress = false;
  List<AvailableBank>? availableBankList;
  late bool isUpdate;

  @override
  State<GenerateNewBank> createState() => _GenerateNewBankState();
}

class _GenerateNewBankState extends State<GenerateNewBank> {
  @override
  void initState() {
    super.initState();
    locator.get<MainBloc>().add(OnLoadAvailableBankModalData());
  }

  Bank? tempBank;

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
    checkSate();
    widget.isUpdate = (widget.bank.id > 0);
    copyBankToTempBank();
    if (widget.isUpdate) {
      bankNameController.text = widget.bank.name;
      branchNameController.text = widget.bank.firstName;
      branchCodeController.text = widget.bank.code.toString();
      accountNumberController.text = widget.bank.bankCardNumber;
      accountOwnerController.text = widget.bank.firstName;
      cardNumberController.text = widget.bank.bankCardNumber;
      shebaNumberController.text = widget.bank.shebaNumber;
      descriptionController.text = widget.bank.description;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(rowWidth: widget.formWidth),
        verticalGapDivider,
        row2(rowWidth: widget.formWidth),
        verticalGapDivider,
        row3(rowWidth: widget.formWidth),
        verticalGapDivider,
        accountOwnerBox(
            width: widget.formWidth, controller: accountOwnerController),
        verticalGapDivider,
        accountTypeDropBox(width: widget.formWidth),
        verticalGapDivider,
        cardNumberBox(
            width: widget.formWidth, controller: cardNumberController),
        verticalGapDivider,
        shebaNumberBox(
            width: widget.formWidth, controller: shebaNumberController),
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
            widget.bank.updateName(bankNameController.text);
            widget.bank.updateBranchName(branchNameController.text);
            int code;
            try {
              code = int.parse(branchCodeController.text);
            } on FormatException {
              code = 0;
            }
            widget.bank.updateCode(code);
            widget.bank.updateAccountNumber(accountNumberController.text);
            widget.bank.updateAccountOwnerName(accountOwnerController.text);
            widget.bank.updateCardNumber(cardNumberController.text);
            widget.bank.updateShebaNumber(shebaNumberController.text);
            widget.bank.updateDescription(descriptionController.text);
            if (widget.isUpdate) {
              locator.get<MainBloc>().add(OnUpdateCounterparty(widget.bank));
            } else {
              locator.get<MainBloc>().add(OnCreateCounterparty(widget.bank));
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
    String value = (widget.isUpdate) ? getBankName() : '';
    DataTableViewModel? dataTableViewModel;
    if (widget.availableBankList != null) {
      dataTableViewModel =
          DataTableViewModelFactory.createTableViewModelFromAvailableBankList(
              widget.availableBankList!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleBankName),
        titleInputSpacing,
        ModalOpenerButton(
          dialogTitle: localization.titleBankList,
          buttonWidth: width,
          formWidth: widget.formWidth - 300,
          value: value,
          formKey: widget._formKey,
          onSelectItemFromTableModal: (bank) {
            if (bank != null) {
              try {
                AvailableBank availableBank = bank as AvailableBank;
                widget.bank.updateBankId(availableBank.id);
                widget.bank.updateFirstName(availableBank.name);
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

  ModalOpenerButton availableBankModalOpenerButton(
      double width, String value, DataTableViewModel dataTableViewModel) {
    return ModalOpenerButton(
      dialogTitle: localization.titleBankList,
      buttonWidth: width,
      formWidth: widget.formWidth - 300,
      value: value,
      formKey: widget._formKey,
      onSelectItemFromTableModal: (bank) {
        if (bank != null) {
          try {
            AvailableBank availableBank = bank as AvailableBank;
            widget.bank.updateBankId(availableBank.id);
          } catch (e) {
            debugPrint("cast failed: $e");
          }
        }
      },
      dataTableViewModel: dataTableViewModel,
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
    /*List<DropDownItem> items = [
      DropDownItem(name: localization.titleItemCurrencyRial),
      DropDownItem(name: localization.titleItemCurrencyUSDollar),
      DropDownItem(name: localization.titleItemCurrencyEuro),
      DropDownItem(name: localization.titleItemCurrencyPound),
      DropDownItem(name: localization.titleItemCurrencyAED),
      DropDownItem(name: localization.titleItemCurrencyTurkishLira),
      DropDownItem(name: localization.titleItemCurrencySwedishKrona),
    ];*/

    List<CurrencyType> items = baseDataModel.currencyTypeList;
    int selectedIndex = items.indexWhere((item) {
      //todo: put correct field in below code
      return item.name.toLowerCase().contains(widget.bank.type.toString());
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
        GenericDropDown<CurrencyType>(
          isEnable: widget.isActive,
          itemWidth: width,
          value: items[selectedIndex],
          items: items,
          onChanged: (value) {
            //todo: put correct field in below code
            //if (value != null) bank.updateCurrencyType(value.name.toInteger());
          },
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
          isEnable: widget.isActive,
          itemWidth: width,
          value: widget.bank.isActive ? items[0] : items[1],
          items: items,
          onChanged: (value) {
            if (value != null) {
              widget.bank.updateIsActive(value.name == localization.active);
            }
          },
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
    List<BankAccType> items = baseDataModel.bankAccTypeList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleAccountType),
        titleInputSpacing,
        GenericDropDown<BankAccType>(
          isEnable: widget.isActive,
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

  void copyBankToTempBank() {
    tempBank = Bank(counterparty: widget.bank.copy());
  }

  void checkSate() {
    final state = context.watch<MainBloc>().state;
    if (state is MainLoadingOnButton) {
      /*    setState(() {
        widget.isShowProgress = state.isShow;
      });*/
    } else if (state is LoadedAvailableBankModalData) {
      widget.availableBankList = state.availableBankList;
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

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }

  String getBankName() {
    String bankName = '';
    if (widget.availableBankList != null) {
      for (AvailableBank availableBank in widget.availableBankList!) {
        if (widget.bank.parentId == availableBank.id) {
          bankName = availableBank.name;
        }
      }
    }
    return bankName;
  }
}
