
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../../main.dart';

class EditAccountForm extends StatefulWidget {
  Account account;

   EditAccountForm({required this.account,super.key});

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 440,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(15),
          color: const Color(0xFFF9F9F9)),
      margin: EdgeInsets.only(
          left: 10, right: 10),
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              localization.editAccount,
              style: const TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 14,
                  fontWeight:
                  FontWeight.bold),
            ),
            Divider(
              color: Color(0xFFDEE2E6),
              height: 25,
              thickness: 2,
            ),
            Text(
              localization.parentAccount,
              style: const TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            LayoutBuilder(builder:
                (context, constrains) {
              double widgetWidth =
                  constrains.maxWidth / 2;
              return Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: Color(
                                0xFFDDE1E5)),
                        borderRadius:
                        BorderRadius
                            .circular(4)),
                    child: DropdownButton<
                        String>(
                      items: <DropdownMenuItem<
                          String>>[
                        DropdownMenuItem(
                            child: SizedBox(
                                width:
                                widgetWidth -
                                    40,
                                child: Text(
                                    "10/001",
                                    style: TextStyle(
                                        color: Color(
                                            0xFF5A5A5A),
                                        fontSize:
                                        11,
                                        fontWeight:
                                        FontWeight.normal)))),
                      ],
                      dropdownColor:
                      Colors.white,
                      focusColor:
                      Colors.white,
                      underline: SizedBox(),
                      padding:
                      EdgeInsets.all(4),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color(
                                  0xFFDDE1E5)),
                          borderRadius:
                          BorderRadius
                              .circular(
                              4)),
                      height: 35,
                      width: widgetWidth,
                      child: TextFormField(
                        onChanged: (value) {},
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(
                                0xFF989B9F)),
                        validator: (value) {
                          if (value == "") {
                            return "test";
                          }
                        },
                        decoration: InputDecoration(
                            hintText:
                            'دارایی های ثابت مشهوده',
                            hintStyle: TextStyle(
                                color: Color(
                                    0xFF989B9F),
                                fontSize: 12,
                                fontWeight:
                                FontWeight
                                    .w400),
                            contentPadding:
                            EdgeInsets
                                .fromLTRB(
                                1,
                                4,
                                4,
                                4)),
                      )),

                  /* ElevatedButton(onPressed: (){
                                                      if(_formKey.currentState!.validate()){

                                                      }
                                                    }, child: SizedBox(height: 10,child: Text("test")))*/
                ],
              );
            }),
            SizedBox(
              height: 8,
            ),
            LayoutBuilder(builder:
                (context, constrains) {
              double widgetWidth =
                  constrains.maxWidth / 2;
              return Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        localization.accountCode,
                        style: const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color(
                                      0xFFDDE1E5)),
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  4)),
                          height: 35,
                          width:
                          widgetWidth - 7,
                          child:
                          TextFormField(
                            onChanged:
                                (value) {},
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(
                                    0xFF989B9F)),
                            validator:
                                (value) {
                              if (value ==
                                  "") {
                                return "test";
                              }
                            },
                            decoration: InputDecoration(
                                hintText:
                                '003',
                                hintStyle: TextStyle(
                                    color: Color(
                                        0xFF989B9F),
                                    fontSize:
                                    12,
                                    fontWeight:
                                    FontWeight
                                        .w400),
                                contentPadding:
                                EdgeInsets
                                    .fromLTRB(
                                    1,
                                    4,
                                    4,
                                    4)),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        localization.status,
                        style: const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500),
                      ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color:
                            Colors.white,
                            border: Border.all(
                                width: 1,
                                color: Color(
                                    0xFFDDE1E5)),
                            borderRadius:
                            BorderRadius
                                .circular(
                                4)),
                        child: DropdownButton<
                            String>(
                          items:
                          dropdownItems,
                          onChanged: (Object?
                          value) {},
                        ),
                      )
                    ],
                  ),

                  /* ElevatedButton(onPressed: (){
                                                      if(_formKey.currentState!.validate()){

                                                      }
                                                    }, child: SizedBox(height: 10,child: Text("test")))*/
                ],
              );
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              localization.description,
              style: const TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w500),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1,
                        color: Color(
                            0xFFDDE1E5)),
                    borderRadius:
                    BorderRadius.circular(
                        4)),
                height: 80,
                width: double.infinity,
                child: TextFormField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  onChanged: (value) {},
                  style: TextStyle(
                      fontSize: 12,
                      color:
                      Color(0xFF989B9F)),
                  validator: (value) {
                    if (value == "") {
                      return "test";
                    }
                  },
                  decoration: InputDecoration(
                      hintText:
                      localization.textWritten,
                      hintStyle: TextStyle(
                          color: Color(
                              0xFF989B9F),
                          fontSize: 12,
                          fontWeight:
                          FontWeight
                              .w400),
                      contentPadding:
                      EdgeInsets.fromLTRB(
                          10,
                          -50,
                          10,
                          0)),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              localization.riyaliType,
              style: const TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w500),
            ),
            LayoutBuilder(builder:
                (context, constrains) {
              double itemWidth =
                  constrains.maxWidth / 2;
              return Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Container(
                    width: itemWidth,
                    child: Row(
                      children: [

                        Text(
                          "مانده ",
                          style:
                          const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: itemWidth,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                      children: [
                        Text(
                          "ماند پیغام دهید",
                          style:
                          const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
            LayoutBuilder(builder:
                (context, constrains) {
              double itemWidth =
                  constrains.maxWidth / 2;
              return Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Container(
                    width: itemWidth,
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged:
                              (value) {},
                        ),
                        Text(
                          "مانده بدهکار شد پیغام دهید",
                          style:
                          const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: itemWidth,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged:
                              (value) {},
                        ),
                        Text(
                          "مانده بدهکار شد پیغام دهید",
                          style:
                          const TextStyle(
                            color: Color(
                                0xFF5A5A5A),
                            fontSize: 11,
                            fontWeight:
                            FontWeight
                                .w500,
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
                  value: 0,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
                Text(
                  "فرقی نمی کند",
                  style: const TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 11,
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }
}