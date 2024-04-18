import 'package:flutter/material.dart';

import '../../../../di/di.dart';
import '../../../../domain/entities/common/people.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import 'modal_elements/drop_down_input.dart';
import 'modal_elements/form_check_box.dart';
import 'modal_elements/form_item_title.dart';
import 'modal_elements/form_text_field.dart';
import 'modal_elements/modal_action_buttons.dart';
import 'modal_elements/multiline_text_input.dart';
import 'modal_elements/tab_button.dart';

class PeopleModal extends StatefulWidget {
  PeopleModal(
      {super.key,
      required this.formWidth,
      this.isActive = true,
      this.iconColor = const Color(0xFF9E79AC),
      required GlobalKey<FormState> formKey,
      required this.people})
      : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final Color iconColor;
  final GlobalKey<FormState> _formKey;
  final People people;

  PeopleModalTab selectedTab = PeopleModalTab.details;
  final Color addButtonBackground = const Color(0xFFEFEFF4);

  @override
  State<PeopleModal> createState() => _PeopleModalState();
}

class _PeopleModalState extends State<PeopleModal> {
  People? tempPeople;

  final Widget horizontalGapDivider = const SizedBox(
    width: 5,
  );

  final Widget verticalGapDivider = const SizedBox(
    height: 20,
  );

  final Widget titleInputSpacing = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    bool isUpdate = (widget.people.id > 0);

    if (isUpdate) {
      copyPeopleToTempPeople();
      /*codeController.text = widget.revolvingFund.code.toString();
      nameController.text = widget.revolvingFund.name;
      //todo: set currect field to limit currency
      revolvingFundLimitController.text =
          widget.revolvingFund.detailId.toString();
      descriptionController.text = widget.revolvingFund.description;*/
    }
    return IgnorePointer(
      ignoring: !widget.isActive,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OptionButtonsRow(),
          verticalGapDivider,
          row1(),
          verticalGapDivider,
          row2(),
          verticalGapDivider,
          row3(),
          verticalGapDivider,
          row4(),
          verticalGapDivider,
          addressInfoLable(),
          divider(),
          verticalGapDivider,
          addressInfoSection(),
          verticalGapDivider,
          if (widget.selectedTab == PeopleModalTab.details) ...detailSection(),
          if (widget.selectedTab == PeopleModalTab.groups) ...groupSection(),
          if (widget.selectedTab == PeopleModalTab.otherFeatures)
            ...OtherFeaturesSection(),
          if (widget.selectedTab == PeopleModalTab.addresses)
            ...addressSection(),
          const SizedBox(
            height: 20,
          ),
          ModalActionButtons(
            formWidth: widget.formWidth,
            formKey: widget._formKey,
            onConfirm: () {
              /* int code;
              try {
                code = int.parse(codeController.text);
              } on FormatException {
                code = 0;
              }

              widget.people.updateCode(code);
              widget.people.updateName(nameController.text);
              widget.people.updateDescription(descriptionController.text);*/

              if (isUpdate) {
                locator
                    .get<MainBloc>()
                    .add(OnUpdateCounterparty(widget.people));
              } else {
                locator
                    .get<MainBloc>()
                    .add(OnCreateCounterparty(widget.people));
              }
            },
          )
        ],
      ),
    );
  }

  detailSection() {
    return [
      FormItemTitle(
        title: localization.details,
        textColor: const Color(0xFF6C3483),
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
      divider(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                title: localization.isSupplier,
                value: false,
              ),
              FormCheckBox(
                title: localization.isCustomer,
                value: false,
              ),
              FormCheckBox(
                title: localization.isIntermediary,
                value: false,
              ),
              FormCheckBox(
                title: localization.isOtherParty,
                value: false,
              ),
              FormCheckBox(
                title: localization.isShareholder,
                value: false,
              )
            ],
          )),
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                title: localization.isInvestor,
                value: false,
              ),
              FormCheckBox(
                title: localization.isLender,
                value: false,
              ),
              FormCheckBox(
                title: localization.isBorrower,
                value: false,
              ),
              FormCheckBox(
                title: localization.isEmployee,
                value: false,
              ),
            ],
          )),
        ],
      ),
      divider(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                title: localization.isBoardMember,
                value: false,
              ),
            ],
          )),
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                title: localization.isRelatedParty,
                value: false,
              ),
            ],
          )),
        ],
      ),
    ];
  }

  groupSection() {
    return [
      FormItemTitle(
        title: localization.groups,
        textColor: const Color(0xFF6C3483),
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
      divider(),
      FormItemTitle(title: localization.salesGroup),
      titleInputSpacing,
      DropDownInput(
        enable: widget.isActive,
        width: (widget.formWidth) - 76,
        value: '',
        items: List.empty(growable: true),
      ),
    ];
  }

  Row addressInfoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [column1(), horizontalGapDivider, column2()],
    );
  }

  Flexible column2() {
    return Flexible(
        flex: 1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormItemTitle(title: localization.address),
              titleInputSpacing,
              MultilineTextInput(
                height: 113,
              )
            ]));
  }

  Flexible column1() {
    return Flexible(
        flex: 1,
        child: Column(
          children: [
            Row(children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItemTitle(title: localization.city),
                    titleInputSpacing,
                    DropDownInput(
                      enable: widget.isActive,
                      width: (widget.formWidth / 4) - 49,
                      value: 'تهران',
                      items: ['تهران'],
                    ),
                  ],
                ),
              ),
              horizontalGapDivider,
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItemTitle(title: localization.phone),
                    titleInputSpacing,
                    FormTextField(
                      textHint: '',
                    ),
                  ],
                ),
              ),
            ]),
            verticalGapDivider,
            Row(children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItemTitle(title: localization.postalCode),
                    titleInputSpacing,
                    FormTextField(
                      textHint: '',
                    ),
                  ],
                ),
              ),
              horizontalGapDivider,
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItemTitle(title: localization.fax),
                    titleInputSpacing,
                    FormTextField(
                      textHint: '',
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ));
  }

  Divider divider({double dividerHeight = 25, double dividerThickness = 2}) {
    return Divider(
      color: const Color(0xFFDEE2E6),
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }

  FormItemTitle addressInfoLable() {
    return FormItemTitle(
      title: localization.accountAddressInfo,
      textColor: const Color(0xFF6C3483),
      fontWeight: FontWeight.w900,
      fontSize: 15,
    );
  }

  Row row4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.rialCredit),
            titleInputSpacing,
            FormTextField(
                textHint: '0', widgetWidth: (widget.formWidth / 2) - 30)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.chequeCredit),
            titleInputSpacing,
            FormTextField(
                textHint: '0', widgetWidth: (widget.formWidth / 2) - 20),
          ],
        ),
      ],
    );
  }

  Row row3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.economicCode),
            titleInputSpacing,
            FormTextField(
                textHint: '', widgetWidth: (widget.formWidth / 4) - 15)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.registrationNumber),
            titleInputSpacing,
            FormTextField(
                textHint: '', widgetWidth: (widget.formWidth / 4) - 20),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.access),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 50,
              value: localization.active,
              items: [localization.active, localization.deactivate],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.transactionStatus),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 45,
              value: 'عادی',
              items: ['عادی'],
            ),
          ],
        ),
      ],
    );
  }

  Row row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.companyName),
            titleInputSpacing,
            FormTextField(
                textHint: '003', widgetWidth: (widget.formWidth / 4) - 15)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.foundationDate),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 50,
              icon: Icon(
                Icons.calendar_month,
                color: widget.iconColor,
                size: 20,
              ),
              value: '',
              items: List.empty(growable: true),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.stockMarketStatus),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 50,
              value: 'غیر بورسی',
              items: ['غیر بورسی'],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.stockMarketStatus),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 43,
              value: localization.active,
              items: [localization.active, localization.deactivate],
            ),
          ],
        ),
      ],
    );
  }

  Row row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.counterpartyType),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 50,
              value: localization.legal,
              items: [localization.legal, localization.individual],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.prefix),
            titleInputSpacing,
            DropDownInput(
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 50,
              value: '',
              items: List.empty(growable: true),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.nationalId),
            titleInputSpacing,
            DropDownInput(
              icon: Icon(
                Icons.add_circle,
                color: widget.iconColor,
                size: 20,
              ),
              enable: widget.isActive,
              width: (widget.formWidth / 4) - 45,
              value: '',
              items: List.empty(growable: true),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle(title: localization.counterpartyCode),
            titleInputSpacing,
            FormTextField(
              widgetWidth: (widget.formWidth / 4) - 12,
              textHint: localization.autoSelect,
            ),
          ],
        ),
      ],
    );
  }

  Container OptionButtonsRow() {
    return Container(
      child: Row(
        children: [
          TabButton(
            topRight: 8,
            bottomRight: 8,
            title: localization.details,
            onClick: () {
              setSelectedTab(PeopleModalTab.details);
            },
            isSelected: widget.selectedTab == PeopleModalTab.details,
          ),
          TabButton(
            title: localization.otherFeatures,
            onClick: () {
              setSelectedTab(PeopleModalTab.otherFeatures);
            },
            isSelected: widget.selectedTab == PeopleModalTab.otherFeatures,
          ),
          TabButton(
            title: localization.addresses,
            onClick: () {
              setSelectedTab(PeopleModalTab.addresses);
            },
            isSelected: widget.selectedTab == PeopleModalTab.addresses,
          ),
          TabButton(
            topLeft: 8,
            bottomLeft: 8,
            title: localization.groups,
            onClick: () {
              setSelectedTab(PeopleModalTab.groups);
            },
            isSelected: widget.selectedTab == PeopleModalTab.groups,
          ),
        ],
      ),
    );
  }

  void setSelectedTab(PeopleModalTab selectedTab) {
    setState(() {
      widget.selectedTab = selectedTab;
    });
  }

  void copyPeopleToTempPeople() {
    tempPeople = People(counterparty: widget.people.copy());
  }

  OtherFeaturesSection() {
    return [
      FormItemTitle(
        title: localization.otherFeatures,
        textColor: const Color(0xFF6C3483),
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
      titleInputSpacing,
      detailTable(),
    ];
  }

  addressSection() {
    return [
      FormItemTitle(
        title: localization.otherFeatures,
        textColor: const Color(0xFF6C3483),
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
      titleInputSpacing,
      detailTable(),
    ];
  }

  Container detailTable() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Color(0xFFE9EBEE))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormItemTitle(
                title: localization.title,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
              FormItemTitle(
                title: localization.value,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.addButtonBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xFF6F42C1),
                          size: 20,
                        ),
                        Container(
                          color: Color(0xFFCED4DA),
                          width: 1,
                          height: 20,
                          margin: EdgeInsets.only(left: 5, right: 2),
                        ),
                        Text(
                          localization.add,
                          style: const TextStyle(
                              color: Color(0xFF7C848C),
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          divider(dividerThickness: 1),
          Container(
            height: 100,
            child: Expanded(
                child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FormItemTitle(
                            title: "لورم ایپسوم",
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          FormItemTitle(
                            title: (400000 * 2).toString(),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          Container(
                            width: 100,
                            height: 33,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFEFEFF4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    minimumSize: const Size.fromRadius(20),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Icon(Icons.delete_outline,
                                      color: Color(0xFFDC3545)),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFEFEFF4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    minimumSize: Size.fromRadius(20),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Icon(Icons.mode_outlined,
                                      color: Color(0xFF198754)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      divider(dividerThickness: 1)
                    ],
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}

enum PeopleModalTab { details, otherFeatures, addresses, groups }
