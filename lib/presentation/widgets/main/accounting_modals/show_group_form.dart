import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/accounting_modals/form_elements/enum_liquidity_type.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';
import 'form_elements/enum_balance_sheet_status_type.dart';
import '../../common/modals/modal_elements/form_item_title.dart';
import '../../common/modals/modal_elements/form_text_field.dart';

class ShowGroupForm extends StatefulWidget {
  ShowGroupForm({super.key, required this.account});

  Account account;

  @override
  State<ShowGroupForm> createState() => _EditGroupFormState();
}

class _EditGroupFormState extends State<ShowGroupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      mainAxisAlignment: MainAxisAlignment.start,
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
                              enable: false,
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
                              enable: false,
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
                            enable: false,
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
                            enable: false,
                            widgetWidth: widgetWidth - 7,
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
                            onChanged: null,
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
                            onChanged: null,
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
                            onChanged: null,
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
                Text(
                  localization.description,
                  style: const TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1, color: const Color(0xFFDDE1E5)),
                        borderRadius: BorderRadius.circular(4)),
                    height: 80,
                    width: double.infinity,
                    child: TextFormField(
                      enabled: false,
                      controller: descriptionController,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      onChanged: null,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF989B9F)),
                      validator: (value) {
                        if (value == "") {
                          return "error";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: localization.textWritten,
                          hintStyle: const TextStyle(
                              color: Color(0xFF989B9F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, -50, 10, 0)),
                    )),
                const SizedBox(
                  height: 15,
                ),
                if (liquidityType == LiquidityType.balanceSheet) ...[
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
                              onChanged: null,
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
                              onChanged: null,
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
                              onChanged: null,
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
                ],
              ],
            ),
          ),
        )
      ],
    );
  }
}
