import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/forms/form_elements/multiline_text_input.dart';

import '../../../../main.dart';
import '../../main/forms/form_elements/form_button.dart';
import '../../main/forms/form_elements/form_item_title.dart';
import '../../main/forms/form_elements/form_text_field.dart';
import 'form_elements/drop_down_input.dart';
import 'form_elements/form_check_box.dart';

class CounterpartyForm extends StatelessWidget {
  const CounterpartyForm({
    super.key,
    required this.formWidth,
    this.isActive = true,
    this.iconColor = const Color(0xFF9E79AC),
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final Color iconColor;
  final GlobalKey<FormState> _formKey;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.counterpartyType),
                titleInputSpacing,
                DropDownInput(
                  enable: isActive,
                  width: (formWidth / 4) - 50,
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
                  enable: isActive,
                  width: (formWidth / 4) - 50,
                  value: '',
                  items: [''],
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
                    color: iconColor,
                    size: 20,
                  ),
                  enable: isActive,
                  width: (formWidth / 4) - 45,
                  value: '',
                  items: [''],
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
                  widgetWidth: (formWidth / 4) - 12,
                  textHint: localization.autoSelect,
                ),
              ],
            ),
          ],
        ),
        verticalGapDivider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.companyName),
                titleInputSpacing,
                FormTextField(
                    textHint: '003', widgetWidth: (formWidth / 4) - 15)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.foundationDate),
                titleInputSpacing,
                DropDownInput(
                  enable: isActive,
                  width: (formWidth / 4) - 50,
                  icon: Icon(
                    Icons.calendar_month,
                    color: iconColor,
                    size: 20,
                  ),
                  value: '',
                  items: [''],
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
                  enable: isActive,
                  width: (formWidth / 4) - 50,
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
                  enable: isActive,
                  width: (formWidth / 4) - 43,
                  value: localization.active,
                  items: [localization.active, localization.deactivate],
                ),
              ],
            ),
          ],
        ),
        verticalGapDivider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.economicCode),
                titleInputSpacing,
                FormTextField(textHint: '', widgetWidth: (formWidth / 4) - 15)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.registrationNumber),
                titleInputSpacing,
                FormTextField(textHint: '', widgetWidth: (formWidth / 4) - 20),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.access),
                titleInputSpacing,
                DropDownInput(
                  enable: isActive,
                  width: (formWidth / 4) - 50,
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
                  enable: isActive,
                  width: (formWidth / 4) - 45,
                  value: 'عادی',
                  items: ['عادی'],
                ),
              ],
            ),
          ],
        ),
        verticalGapDivider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.rialCredit),
                titleInputSpacing,
                FormTextField(textHint: '0', widgetWidth: (formWidth / 2) - 30)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.chequeCredit),
                titleInputSpacing,
                FormTextField(textHint: '0', widgetWidth: (formWidth / 2) - 20),
              ],
            ),
          ],
        ),
        verticalGapDivider,
        FormItemTitle(
          title: localization.accountAddressInfo,
          textColor: const Color(0xFF6C3483),
          fontWeight: FontWeight.w900,
          fontSize: 15,
        ),
        const Divider(
          color: Color(0xFFDEE2E6),
          height: 25,
          thickness: 2,
        ),
        verticalGapDivider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
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
                              enable: isActive,
                              width: (formWidth / 4) - 49,
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
                )),
            horizontalGapDivider,
            Flexible(
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
                    ]))
          ],
        ),
        verticalGapDivider,
        FormItemTitle(
          title: localization.details,
          textColor: const Color(0xFF6C3483),
          fontWeight: FontWeight.w900,
          fontSize: 15,
        ),
        const Divider(
          color: Color(0xFFDEE2E6),
          height: 25,
          thickness: 2,
        ),
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
        const Divider(
          color: Color(0xFFDEE2E6),
          height: 25,
          thickness: 2,
        ),
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
        FormItemTitle(
          title: localization.groups,
          textColor: const Color(0xFF6C3483),
          fontWeight: FontWeight.w900,
          fontSize: 15,
        ),
        const Divider(
          color: Color(0xFFDEE2E6),
          height: 25,
          thickness: 2,
        ),
        FormItemTitle(title: localization.salesGroup),
        titleInputSpacing,
        DropDownInput(
          enable: isActive,
          width: (formWidth) - 76,
          value: '',
          items: [''],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormButton(
              itemWidth: (formWidth / 2) - 25,
              background: const Color(0xFF6C3483),
              textColor: Colors.white,
              title: localization.captionSuccess,
              onClick: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {}
              },
            ),
            FormButton(
                itemWidth: (formWidth / 2) - 25,
                background: const Color(0xFFD9BCE4),
                textColor: const Color(0xFF6C3483),
                title: localization.captionCancel,
                onClick: () {
                  Navigator.of(context).pop();
                }),
          ],
        )
      ],
    );
  }
}
