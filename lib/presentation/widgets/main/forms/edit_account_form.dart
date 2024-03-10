import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'form_elements/form_button.dart';
import 'form_elements/form_item_title.dart';
import 'form_elements/form_text_field.dart';

class EditAccountForm extends StatefulWidget {
  //Account account;

  const EditAccountForm({/*required this.account*/ super.key});

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  final _formKey = GlobalKey<FormState>();
  RialyTypeItem rialyTypeItem = RialyTypeItem.debtRemaining;

  @override
  Widget build(BuildContext context) {
    // RialyTypeItem rialyTypeItem = RialyTypeItem.fromValue(widget.account.mahiatRialy);

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
                  localization.editAccount,
                  style: const TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const  Divider(
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
                            border:
                                Border.all(width: 1, color:const Color(0xFFDDE1E5)),
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButton<String>(
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                                child: SizedBox(
                                    width: widgetWidth - 40,
                                    child:const Text("10/001",
                                        style: TextStyle(
                                            color: Color(0xFF5A5A5A),
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal)))),
                          ],
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          underline:const SizedBox(),
                          padding:const EdgeInsets.all(4),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FormTextField(
                          widgetWidth: widgetWidth,
                          textHint: localization.tangibleFixedAssets),
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
                          const  SizedBox(
                            height: 5,
                          ),
                          FormTextField(
                              widgetWidth: widgetWidth, textHint: '003'),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormItemTitle(title: localization.status),
                          const  SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border.all(width: 1, color:const Color(0xFFDDE1E5)),
                                borderRadius: BorderRadius.circular(4)),
                            child: DropdownButton<String>(
                              items:getDropdownItems(widgetWidth - 40),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              underline:const SizedBox(),
                              padding:const EdgeInsets.all(4),
                              onChanged: (value) {},
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
                          hintStyle:const TextStyle(
                              color: Color(0xFF989B9F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          contentPadding:const EdgeInsets.fromLTRB(10, -50, 10, 0)),
                    )),
                const SizedBox(
                  height: 10,
                ),
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
                              value: RialyTypeItem.debtRemaining,
                              groupValue: rialyTypeItem,
                              onChanged: (value) =>
                                  onChangeRadio(RialyTypeItem.debtRemaining),
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
                              value: RialyTypeItem.creditRemaining,
                              groupValue: rialyTypeItem,
                              onChanged: (value) =>
                                  onChangeRadio(RialyTypeItem.creditRemaining),
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
                              value: RialyTypeItem.cannotBeDebt,
                              groupValue: rialyTypeItem,
                              onChanged: (value) =>
                                  onChangeRadio(RialyTypeItem.cannotBeDebt),
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
                              value: RialyTypeItem.cannotBeCredit,
                              groupValue: rialyTypeItem,
                              onChanged: (value) =>
                                  onChangeRadio(RialyTypeItem.cannotBeCredit),
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
                      value: RialyTypeItem.noMatter,
                      groupValue: rialyTypeItem,
                      onChanged: (value) =>
                          onChangeRadio(RialyTypeItem.noMatter),
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
                const SizedBox(height: 10,),
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
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>>  getDropdownItems(double widthItem) {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "1", child: SizedBox(width: widthItem ,child: FormItemTitle(title: localization.active,))),
      DropdownMenuItem(value: "0", child: SizedBox(width: widthItem ,child: FormItemTitle(title: localization.deactivate,))),
    ];
    return menuItems;
  }

  onChangeRadio(RialyTypeItem value) {
    setState(() {
      rialyTypeItem = value;
    });
  }
}

enum RialyTypeItem {
  debtRemaining(0),
  creditRemaining(1),
  cannotBeDebt(2),
  cannotBeCredit(3),
  noMatter(4);

  final int value;

  const RialyTypeItem(this.value);

  static RialyTypeItem fromValue(int value) {
    return RialyTypeItem.values[value];
  }
}
