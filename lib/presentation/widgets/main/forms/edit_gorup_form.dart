import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/snakbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/form_elements/enum_balance_sheet_status_type.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/form_elements/enum_liquidity_type.dart';

import '../../../../di/di.dart';
import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../common/forms/form_elements/multiline_text_input.dart';
import 'form_elements/form_button.dart';
import 'form_elements/form_item_title.dart';
import 'form_elements/form_text_field.dart';

class EditGroupForm extends StatefulWidget {
  bool isNew;
  Account account;
  late Account tempAccount;

  EditGroupForm({
    super.key,
    required this.account,
    this.isNew = false,
  });

  @override
  State<EditGroupForm> createState() => _EditGroupFormState();
}

class _EditGroupFormState extends State<EditGroupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController groupCodeController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController orderIndexOneController = TextEditingController();
  TextEditingController orderIndexTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    copyAccountToTempAccount();
  }

  @override
  Widget build(BuildContext context) {
    groupCodeController.text = widget.account.groupCode;
    descriptionController.text = widget.account.description;
    LiquidityType? liquidityType;
    if (widget.account.mahiatRialy > -1) {
      liquidityType = LiquidityType.fromValue(widget.account.mahiatRialy);
    }

    BalanceSheetStatusType balanceSheetStatusType;
    if (widget.account.balanceSheetType > -1) {
      balanceSheetStatusType =
          BalanceSheetStatusType.fromValue(widget.account.balanceSheetType);
    }

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
                  widget.isNew?localization.newGroup:localization.editGroup,
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
                const SizedBox(
                  height: 8,
                ),
                LayoutBuilder(builder: (context, constrains) {
                  double widgetWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.groupCode),
                          const SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                              inputType: TextInputType.number,
                              controller: groupCodeController,
                              widgetWidth: widgetWidth - 7,
                              textHint: widget.account.groupCode),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.groupName),
                          const SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                              controller: groupNameController,
                              widgetWidth: widgetWidth - 7,
                              textHint: widget.account.displayName),
                        ],
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                LayoutBuilder(builder: (context, constrains) {
                  double widgetWidth = constrains.maxWidth / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.desiredOne),
                          const SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                            inputType: TextInputType.number,
                            controller: orderIndexOneController,
                            widgetWidth: widgetWidth - 7,
                            textHint: widget.account.indexOrder1.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.desiredTow),
                          const SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                            inputType: TextInputType.number,
                            controller: orderIndexTwoController,
                            widgetWidth: widgetWidth -7 ,
                            textHint: widget.account.indexOrder2.toString(),
                          )
                        ],
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                FormItemTitle(title: localization.liquidityType),
                const SizedBox(
                  height: 5,
                ),
                LayoutBuilder(builder: (context, constrains) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: LiquidityType.balanceSheet.value,
                            groupValue: widget.account.mahiatRialy,
                            onChanged: (value) {
                              setState(() {
                                widget.account.updateMahiatRialy(value as int);
                                widget.account.updateBalanceSheetType(
                                    widget.tempAccount.balanceSheetType);
                              });
                            },
                          ),
                          Text(
                            localization.balanceSheet,
                            style: const TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: LiquidityType.profitAndLoss.value,
                            groupValue: widget.account.mahiatRialy,
                            onChanged: (value) {
                              setState(() {
                                widget.account.updateMahiatRialy(value as int);
                                widget.account.updateBalanceSheetType(-1);
                              });
                            },
                          ),
                          Text(
                            localization.profitAndLoss,
                            style: const TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: LiquidityType.disciplinary.value,
                            groupValue: widget.account.mahiatRialy,
                            onChanged: (value) {
                              setState(() {
                                widget.account.updateMahiatRialy(value as int);
                                widget.account.updateBalanceSheetType(-1);
                              });
                            },
                          ),
                          Text(
                            localization.disciplinary,
                            style: const TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
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
                  height: 5,
                ),
                MultilineTextInput(enable: true, controller: descriptionController,),
                const SizedBox(
                  height: 15,
                ),
                if (liquidityType != null && liquidityType == LiquidityType.balanceSheet) ...[
                  FormItemTitle(title: localization.balanceSheetStatus),
                  LayoutBuilder(builder: (context, constrains) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: BalanceSheetStatusType.debt.value,
                              groupValue: widget.account.balanceSheetType,
                              onChanged: (value) {
                                setState(() {
                                  widget.account.updateBalanceSheetType(
                                      BalanceSheetStatusType.debt.value);
                                });
                              },
                            ),
                            Text(
                              localization.debt,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: BalanceSheetStatusType.asset.value,
                              groupValue: widget.account.balanceSheetType,
                              onChanged: (value) {
                                setState(() {
                                  widget.account
                                      .updateBalanceSheetType(value as int);
                                });
                              },
                            ),
                            Text(
                              localization.asset,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: BalanceSheetStatusType
                                  .proprietaryRights.value,
                              groupValue: widget.account.balanceSheetType,
                              onChanged: (value) {
                                setState(() {
                                  widget.account
                                      .updateBalanceSheetType(value as int);
                                });
                              },
                            ),
                            Text(
                              localization.proprietaryRights,
                              style: const TextStyle(
                                color: Color(0xFF5A5A5A),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  )
                ],
                ActionsButtonWidget(
                    formKey: _formKey,
                    widget: widget,
                    descriptionController: descriptionController,
                    groupCodeController: groupCodeController,
                    groupNameController: groupNameController,
                    orderIndexOneController: orderIndexOneController,
                    orderIndexTwoController: orderIndexTwoController)
              ],
            ),
          ),
        )
      ],
    );
  }

  void copyAccountToTempAccount() {
    widget.tempAccount = widget.account.copy();
  }
}

class ActionsButtonWidget extends StatefulWidget {
  ActionsButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.widget,
    required this.descriptionController,
    required this.groupCodeController,
    required this.groupNameController,
    required this.orderIndexOneController,
    required this.orderIndexTwoController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final EditGroupForm widget;
  final TextEditingController descriptionController;
  final TextEditingController groupCodeController;
  final TextEditingController groupNameController;
  final TextEditingController orderIndexOneController;
  final TextEditingController orderIndexTwoController;
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
      return widget.isShowProgress
          ? SizedBox(
              width: itemWidth,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            )
          : Row(
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
                          .updateGroupCode(widget.groupCodeController.text);
                      widget.widget.account
                          .updateDisplayName(widget.groupNameController.text);
                      widget.widget.account.updateIndexOrder1(
                          int.parse(widget.orderIndexOneController.text));
                      widget.widget.account.updateIndexOrder1(
                          int.parse(widget.orderIndexTwoController.text));

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
    } else if (state is MainUpdatedAccountFailed) {
      debugPrint(' editGroup error: ${state.errorMessage}');
      Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    }
  }
}
