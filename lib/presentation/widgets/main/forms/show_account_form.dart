import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import 'form_elements/enum__rialy_type.dart';
import 'form_elements/form_item_title.dart';
import 'form_elements/form_text_field.dart';

class ShowAccountForm extends StatefulWidget {
  ShowAccountForm({super.key, required this.account});

  Account account;

  @override
  State<ShowAccountForm> createState() => _ShowAccountFormState();
}

class _ShowAccountFormState extends State<ShowAccountForm> {
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  RialType accountType = RialType.noMatter;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MainBloc>().state;
    descriptionController.text = widget.account.description;
    if (state is MainAccountDetailInFormVisibility) {
      if (widget.account.type >= 0) {
        accountType = RialType.fromValue(widget.account.type);
      }
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
                        child: IgnorePointer(
                          ignoring: true,
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
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FormTextField(
                          enable: false,
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
                              enable: false,
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
                            child: IgnorePointer(
                              ignoring: true,
                              child: DropdownButton<String>(
                                value: getIsActiveCaption(),
                                items: getDropdownItems(widgetWidth - 40),
                                dropdownColor: Colors.white,
                                focusColor: Colors.white,
                                underline: const SizedBox(),
                                padding: const EdgeInsets.all(4),
                                onChanged: (value) {
                                  value = value;
                                },
                              ),
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
                      onChanged: (value) {},
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF989B9F)),
                      validator: (value) {},
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
                  height: 10,
                ),
                if (widget.account.accountLevel > 0 &&
                    !widget.account.hasChildren) ...[
                  FormItemTitle(title: localization.riyaliType),
                  IgnorePointer(
                    ignoring: true,
                    child: Column(
                      children: [
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
                                      onChanged: null,
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
                                      onChanged: null,
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
                                      onChanged: null,
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
                                      onChanged: null,
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
                              onChanged: null,
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
                    ],
                  ),
                ),
              ]

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
