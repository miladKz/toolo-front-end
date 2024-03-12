import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/form_elements/enum_balance_sheet_type.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';
import 'form_elements/form_button.dart';
import 'form_elements/form_item_title.dart';
import 'form_elements/form_text_field.dart';

class EditGroupForm extends StatefulWidget {
  EditGroupForm({super.key,required this.account});
  Account account;
  @override
  State<EditGroupForm> createState() => _EditGroupFormState();
}

class _EditGroupFormState extends State<EditGroupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    descriptionController.text = widget.account.description;
    BalanceSheetType balanceSheetType = BalanceSheetType.fromValue(widget.account.balanceSheetType);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[ Container(
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
                localization.editGroup,
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
                        FormItemTitle(title:localization.groupCode),
                        const SizedBox(
                          height: 5,
                        ),
                        FormTextField(
                            widgetWidth: widgetWidth,
                            text: widget.account.groupCode),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      FormItemTitle(title:localization.groupName),
                       const SizedBox(height: 5,),
                        FormTextField(
                            widgetWidth: widgetWidth,
                            text: widget.account.displayName),
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
                        FormItemTitle(title:localization.desiredOne),
                       const SizedBox(
                          height: 5,
                        ),
                        FormTextField(
                          widgetWidth: widgetWidth,
                          text: widget.account.indexOrder1.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormItemTitle(title:localization.desiredTow),
                       const SizedBox(
                          height: 5,
                        ),
                        FormTextField(
                          widgetWidth: widgetWidth,
                          text: widget.account.indexOrder2.toString(),
                        )
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 10,
              ),
              FormItemTitle(title:localization.liquidityType),
             const SizedBox(height: 5,),
              LayoutBuilder(builder: (context, constrains) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: BalanceSheetType.balanceSheet,
                          groupValue: balanceSheetType,
                          onChanged: (value) {},
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
                          value: BalanceSheetType.profitAndLoss,
                          groupValue: balanceSheetType,
                          onChanged: (value) {},
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
                          value: BalanceSheetType.disciplinary,
                          groupValue: balanceSheetType,
                          onChanged: (value) {},
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
                      border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
                      borderRadius: BorderRadius.circular(4)),
                  height: 80,
                  width: double.infinity,
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    onChanged: (value) {},
                    style:const TextStyle(fontSize: 12, color: Color(0xFF989B9F)),
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
                        contentPadding: const EdgeInsets.fromLTRB(10, -50, 10, 0)),
                  )),
              const SizedBox(
                height: 15,
              ),
              if(balanceSheetType == BalanceSheetType.balanceSheet)...[
                  FormItemTitle(title: localization.balanceSheetStatus),
                  LayoutBuilder(builder: (context, constrains) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: BalanceSheetType.balanceSheet,
                            groupValue: balanceSheetType,
                            onChanged: (value) {},
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
                            value: BalanceSheetType.profitAndLoss,
                            groupValue: balanceSheetType,
                            onChanged: (value) {},
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
                            value: BalanceSheetType.disciplinary,
                            groupValue: balanceSheetType,
                            onChanged: (value) {},
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

              LayoutBuilder(builder: (context, constrains) {
                double itemWidth = (constrains.maxWidth / 2) - 10;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormButton(
                      itemWidth: itemWidth,
                      background:const Color(0xFF6C3483),
                      textColor: Colors.white,
                      title: localization.captionSuccess,
                      onClick: () {},
                    ),
                    FormButton(
                        itemWidth: itemWidth,
                        background:const Color(0xFFD9BCE4),
                        textColor: const Color(0xFF804D95),
                        title: localization.captionCancel,
                        onClick: () {}),
                  ],
                );
              })
            ],
          ),
        ),
      )],
    );
  }
}


