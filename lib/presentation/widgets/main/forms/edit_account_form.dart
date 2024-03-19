import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/snakbar.dart';

import '../../../../di/di.dart';
import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../common/forms/form_elements/multiline_text_input.dart';
import 'form_elements/enum__rialy_type.dart';
import 'form_elements/form_button.dart';
import 'form_elements/form_item_title.dart';
import 'form_elements/form_text_field.dart';

class EditAccountForm extends StatefulWidget {
  Account account;
  bool isNew;

  //Account tmpAaccount;

  EditAccountForm(
      {super.key,
      required this.account,
      this.isNew = false,});

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountCodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RialType accountType = RialType.noMatter;

  @override
  Widget build(BuildContext context) {
    if (widget.account.type >= 0) {
      accountType = RialType.fromValue(widget.account.type);
    }
    descriptionController.text = widget.account.description;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFF9F9F9)),
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isNew?localization.newAccount:localization.editAccount,
                  style: const TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Color(0xFFDEE2E6),
                  height: 25,
                  thickness: 2,
                ),
                FormItemTitle(title: localization.parentAccount),
                const SizedBox(
                  height: 5,
                ),
                LayoutBuilder(builder: (context, constrains) {
                  double widgetWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: const Color(0xFFDDE1E5)),
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButton<String>(
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                                child: SizedBox(
                                    width: widgetWidth - 40,
                                    child: Text(widget.account.accountcd,
                                        style: const TextStyle(
                                            color: Color(0xFF5A5A5A),
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal)))),
                          ],
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          underline: const SizedBox(),
                          padding: const EdgeInsets.all(4),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FormTextField(
                        enable: false,
                          controller: accountNameController,
                          widgetWidth: widgetWidth - 7,
                          textHint: widget.account.displayName),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                LayoutBuilder(builder: (context, constrains) {
                  double widgetWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.accountCode),
                          const SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                              controller: accountCodeController,
                              widgetWidth: widgetWidth - 7,
                              textHint: getAccountCode()),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.status),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: const Color(0xFFDDE1E5)),
                                borderRadius: BorderRadius.circular(4)),
                            child: DropdownButton<String>(
                              value: getIsActiveCaption(),
                              items: getDropdownItems(widgetWidth - 40),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              underline: const SizedBox(),
                              padding: const EdgeInsets.all(4),
                              onChanged: (value) {
                                setState(() {
                                  widget.account.updateIsActive(
                                      value == localization.active);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                FormItemTitle(title: localization.description),
                const SizedBox(
                  height: 10,
                ),
                MultilineTextInput(enable: true, controller: descriptionController,),
                const SizedBox(
                  height: 10,
                ),
              if (widget.account.accountLevel >0 && !widget.account.hasChildren) ...[
                FormItemTitle(title: localization.riyaliType),
                LayoutBuilder(builder: (context, constrains) {
                  double itemWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: itemWidth,
                        child: Row(
                          children: [
                            Radio(
                              value: RialType.debtRemaining.value,
                              groupValue: widget.account.type,
                              onChanged: (value) => onChangeRadio(value as int),
                            ),
                            Text(
                              localization.debtRemaining,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: RialType.creditRemaining.value,
                              groupValue: widget.account.type,
                              onChanged: (value) => onChangeRadio(value as int),
                            ),
                            Text(
                              localization.creditRemaining,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                LayoutBuilder(builder: (context, constrains) {
                  double itemWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: itemWidth,
                        child: Row(
                          children: [
                            Radio(
                              value: RialType.cannotBeDebt.value,
                              groupValue: widget.account.type,
                              onChanged: (value) => onChangeRadio(value as int),
                            ),
                            Text(
                              localization.cannotBeDebt,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: RialType.cannotBeCredit.value,
                              groupValue: widget.account.type,
                              onChanged: (value) => onChangeRadio(value as int),
                            ),
                            Text(
                              localization.cannotBeCredit,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                Row(
                  children: [
                    Radio(
                      value: RialType.noMatter.value,
                      groupValue: widget.account.type,
                      onChanged: (value) => onChangeRadio(value as int),
                    ),
                    Text(
                      localization.noMatter,
                      style: const TextStyle(
                        color: Color(0xFF5A5A5A),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                ActionsButtonWidget(
                    formKey: _formKey,
                    widget: widget,
                    descriptionController: descriptionController,
                    accountCodeController: accountCodeController,
                    accountNameController: accountNameController, )
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems(double widthItem) {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: localization.active,
          child: SizedBox(
              width: widthItem,
              child: FormItemTitle(
                title: localization.active,
              ))),
      DropdownMenuItem(
          value: localization.deactivate,
          child: SizedBox(
              width: widthItem,
              child: FormItemTitle(
                title: localization.deactivate,
              ))),
    ];
    return menuItems;
  }

  onChangeRadio(int value) {
    setState(() {
      widget.account.updateType(value);
    });
  }

  getAccountCode() {
    String accountCode = '';
    switch (widget.account.accountLevel) {
      case 1:
        accountCode = widget.account.accCode1;
        break;
      case 2:
        accountCode = widget.account.accCode2;
        break;
      case 3:
        accountCode = widget.account.accCode3;
        break;
      case 4:
        accountCode = widget.account.accCode4;
        break;
    }
    return accountCode;
  }

  getIsActiveCaption() {
    return widget.account.isActive
        ? localization.active
        : localization.deactivate;
  }

  String getParentCode() {
    return '';
  }
}

class ActionsButtonWidget extends StatefulWidget {
  ActionsButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.widget,
    required this.descriptionController,
    required this.accountCodeController,
    required this.accountNameController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final EditAccountForm widget;
  final TextEditingController descriptionController;
  final TextEditingController accountCodeController;
  final TextEditingController accountNameController;
  bool isShowProgress = false;

  @override
  State<ActionsButtonWidget> createState() => _ActionsButtonWidgetState();
}

class _ActionsButtonWidgetState extends State<ActionsButtonWidget> {
  @override
  Widget build(BuildContext context) {
    checkSate();
    return LayoutBuilder(builder: (context, constrains) {
      double itemWidth = (constrains.maxWidth / 2) - 10;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormButton(
            itemWidth: itemWidth,
            background: const Color(0xFF6C3483),
            textColor: Colors.white,
            title: localization.captionSuccess,
            onClick: () {
              if (widget._formKey.currentState != null &&
                  widget._formKey.currentState!.validate()) {
                widget.widget.account
                    .updateDescription(widget.descriptionController.text);
                widget.widget.account
                    .updateAccountcd(widget.accountCodeController.text);
                widget.widget.account
                    .updateDisplayName(widget.accountNameController.text);

                locator
                    .get<MainBloc>()
                    .add(OnUpdateAccount(widget.widget.account));
              }
            },
          ),
          FormButton(
              itemWidth: itemWidth,
              background: const Color(0xFFD9BCE4),
              textColor: const Color(0xFF804D95),
              title: localization.captionCancel,
              onClick: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    });
  }

  void checkSate() {
    final state = context.watch<MainBloc>().state;
    if (state is MainLoadingOnButton) {
      setState(() {
        widget.isShowProgress = state.isShow;
      });
    } else if (state is MainUpdatedAccountSuccess) {
      Navigator.of(context).pop();
    }else if (state is MainUpdatedAccountFailed) {
      debugPrint( ' editGroup error: ${state.errorMessage}');
      Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) => showSnack(title: localization.errorTitle, message: state.errorMessage));

    }
  }
}
