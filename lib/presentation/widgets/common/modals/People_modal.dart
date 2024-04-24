import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/common/city.dart';

import '../../../../di/di.dart';
import '../../../../domain/entities/base/enums/people_counterparty_type.dart';
import '../../../../domain/entities/common/people.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../factories/table_view_model_factory.dart';
import '../../../view_models/table_view_model.dart';
import '../jalali_date_picker.dart';
import '../snakbar.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/drop_down_input.dart';
import 'modal_elements/form_check_box.dart';
import 'modal_elements/form_item_title.dart';
import 'modal_elements/form_text_field.dart';
import 'modal_elements/modal_action_buttons.dart';
import 'modal_elements/modal_opener_button.dart';
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
  List<City>? cityList;
  final People people;
  late bool isUpdate;

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

  TextEditingController codeController = TextEditingController(text: '');

  TextEditingController nationalCodeController =
      TextEditingController(text: '');

  TextEditingController companyNameController = TextEditingController(text: '');

  TextEditingController economicCodeController =
      TextEditingController(text: '');

  TextEditingController registrationNumberController =
      TextEditingController(text: '');

  TextEditingController rialCreditController = TextEditingController(text: '');
  TextEditingController chequeCreditController =
      TextEditingController(text: '');
  TextEditingController postalCodeController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController faxController = TextEditingController(text: '');
  TextEditingController datePickerController = TextEditingController(text: '');
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    locator.get<MainBloc>().add(OnLoadCityList());
  }

  @override
  Widget build(BuildContext context) {
    widget.isUpdate = (widget.people.id > 0);
    checkState();
    if (widget.isUpdate) {
      copyPeopleToTempPeople();
      nationalCodeController =
          TextEditingController(text: widget.people.nationalCode);

      codeController =
          TextEditingController(text: widget.people.code.toString());

      companyNameController =
          TextEditingController(text: widget.people.companyName);

      economicCodeController =
          TextEditingController(text: widget.people.postalCode);

      registrationNumberController =
          TextEditingController(text: widget.people.registrationNumber);

      rialCreditController =
          TextEditingController(text: widget.people.rialCredit.toString());
      chequeCreditController =
          TextEditingController(text: widget.people.chequeCredit.toString());
      postalCodeController =
          TextEditingController(text: widget.people.postalCode);
      addressController = TextEditingController(text: widget.people.address);
      phoneController = TextEditingController(text: widget.people.phone);
      faxController = TextEditingController(text: widget.people.fax);
      firstNameController =
          TextEditingController(text: widget.people.firstName);

      lastNameController = TextEditingController(text: widget.people.lastName);
      //datePickerController = TextEditingController(text: widget.people.foundationDate.toIso8601String());
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
          addressInfoLabel(),
          divider(),
          verticalGapDivider,
          addressInfoSection(),
          verticalGapDivider,
          if (widget.selectedTab == PeopleModalTab.details) ...detailSection(),
          if (widget.selectedTab == PeopleModalTab.groups) ...groupSection(),
          if (widget.selectedTab == PeopleModalTab.otherFeatures)
            ...otherFeaturesSection(),
          if (widget.selectedTab == PeopleModalTab.addresses)
            ...addressSection(),
          const SizedBox(
            height: 20,
          ),
          ModalActionButtons(
            formWidth: widget.formWidth,
            formKey: widget._formKey,
            onConfirm: () {
              int code;
              try {
                code = int.parse(codeController.text);
              } on FormatException {
                code = 0;
              }
              widget.people.updateCode(code);

              widget.people.updateNationalCode(nationalCodeController.text);

              widget.people.updateCompanyName(companyNameController.text);

              widget.people.updateEconomicCode(economicCodeController.text);

              widget.people
                  .updateRegistrationNumber(registrationNumberController.text);

              int rialCredit;
              try {
                rialCredit = int.parse(rialCreditController.text);
              } on FormatException {
                rialCredit = 0;
              }
              widget.people.updateRialCredit(rialCredit);

              int chequeCredit;
              try {
                chequeCredit = int.parse(rialCreditController.text);
              } on FormatException {
                chequeCredit = 0;
              }
              widget.people.updateChequeCredit(chequeCredit);

              widget.people.updatePostalCode(postalCodeController.text);

              widget.people.updateAddress(addressController.text);

              widget.people.updatePhone(phoneController.text);

              widget.people.updateFax(faxController.text);

              widget.people.updateFoundationDate(faxController.text);

              widget.people.updateName(firstNameController.text);

              widget.people.updateLastName(lastNameController.text);

              if (widget.isUpdate) {
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
                value: widget.people.isSupplier,
                onChange: (value) {
                  widget.people.isSupplier = value;
                },
              ),
              FormCheckBox(
                title: localization.isCustomer,
                value: widget.people.isCustomer,
                onChange: (value) {
                  widget.people.isCustomer = value;
                },
              ),
              FormCheckBox(
                title: localization.isIntermediary,
                value: widget.people.isIntermediary,
                onChange: (value) {
                  widget.people.isIntermediary = value;
                },
              ),
              FormCheckBox(
                title: localization.isOtherParty,
                value: widget.people.isOtherParty,
                onChange: (value) {
                  widget.people.isOtherParty = value;
                },
              ),
              FormCheckBox(
                title: localization.isShareholder,
                value: widget.people.isShareholder,
                onChange: (value) {
                  widget.people.isShareholder = value;
                },
              )
            ],
          )),
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                title: localization.isInvestor,
                value: widget.people.isInvestor,
                onChange: (value) {
                  widget.people.isInvestor = value;
                },
              ),
              FormCheckBox(
                title: localization.isLender,
                value: widget.people.isLender,
                onChange: (value) {
                  widget.people.isLender = value;
                },
              ),
              FormCheckBox(
                title: localization.isBorrower,
                value: widget.people.isBorrower,
                onChange: (value) {
                  widget.people.isBorrower = value;
                },
              ),
              FormCheckBox(
                title: localization.isEmployee,
                value: widget.people.isEmployee,
                onChange: (value) {
                  widget.people.isEmployee = value;
                },
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
                  value: widget.people.isBoardMember,
                  onChange: (value) {
                    widget.people.isBoardMember = value;
                  }),
            ],
          )),
          Flexible(
              child: Column(
            children: [
              FormCheckBox(
                  title: localization.isDependent,
                  value: false,
                  onChange: (value) {
                    widget.people.isDependent = value;
                  }),
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
      children: [
        column1(),
        horizontalGapDivider,
        column2(),
        horizontalGapDivider,
        column3(),
      ],
    );
  }

  Flexible column2() {
    return Flexible(
        flex: 1,
        child: Column(
          children: [phoneBox(), verticalGapDivider, faxBox()],
        ));
  }

  Column faxBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.fax),
        titleInputSpacing,
        FormTextField(
          controller: faxController,
        ),
      ],
    );
  }

  Column phoneBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.phone),
        titleInputSpacing,
        FormTextField(
          controller: phoneController,
        ),
      ],
    );
  }

  Flexible column3() {
    return Flexible(flex: 2, child: addressBox());
  }

  Column addressBox() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormItemTitle(title: localization.address),
          titleInputSpacing,
          MultilineTextInput(
            height: 113,
            controller: addressController,
          )
        ]);
  }

  Flexible column1() {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          cityModalOpenerButton(width: double.infinity),
          verticalGapDivider,
          postalCodeBox()
        ],
      ),
    );
  }

  Column postalCodeBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.postalCode),
        titleInputSpacing,
        FormTextField(
          controller: postalCodeController,
        ),
      ],
    );
  }

  Widget cityModalOpenerButton({required double width}) {
    String value = (widget.isUpdate) ? getCityName() : '';
    DataTableViewModel? dataTableViewModel;
    if (widget.cityList != null) {
      dataTableViewModel =
          DataTableViewModelFactory.createTableViewModelFromCityList(
              widget.cityList!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.city),
        titleInputSpacing,
        ModalOpenerButton(
          dialogTitle: localization.titleCityList,
          buttonWidth: width,
          formWidth: widget.formWidth - 200,
          value: value,
          formKey: widget._formKey,
          onSelectItemFromTableModal: (selectedCity) {
            if (selectedCity != null) {
              try {
                City city = selectedCity as City;
                widget.people.updateCityId(city.id);
              } catch (e) {
                debugPrint(e.toString());
              }
            }
          },
          dataTableViewModel: dataTableViewModel,
        ),
      ],
    );
  }

  Divider divider({double dividerHeight = 25, double dividerThickness = 2}) {
    return Divider(
      color: const Color(0xFFDEE2E6),
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }

  FormItemTitle addressInfoLabel() {
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
        rialCreditBox(width: (widget.formWidth / 2) - 30),
        chequeCreditBox(width: (widget.formWidth / 2) - 20),
      ],
    );
  }

  Column chequeCreditBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.chequeCredit),
        titleInputSpacing,
        FormTextField(
          textHint: localization.numericZero,
          widgetWidth: width,
          controller: chequeCreditController,
        ),
      ],
    );
  }

  Column rialCreditBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.rialCredit),
        titleInputSpacing,
        FormTextField(
          textHint: localization.numericZero,
          widgetWidth: width,
          controller: rialCreditController,
        )
      ],
    );
  }

  Row row3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        economicCodeBox(width: (widget.formWidth / 4) - 15),
        registrationNumber(width: (widget.formWidth / 4) - 20),
        isActiveBox(width: (widget.formWidth / 4) - 50),
        customerStatus(width: (widget.formWidth / 4) - 45),
      ],
    );
  }

  Column customerStatus({required double width}) {
    List<CustomerStatus> customerStatusList = baseDataModel.customerStatusList;
    CustomerStatus? selectedCustomerStatus = customerStatusList
        .firstWhere((element) => element.id == widget.people.customerStatus);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.transactionStatus),
        titleInputSpacing,
        GenericDropDown<CustomerStatus>(
          isEnable: widget.isActive,
          itemWidth: width,
          value: selectedCustomerStatus,
          items: customerStatusList,
          onChanged: (item) {
            if (item != null) {
              widget.people.customerStatus = item.id;
            }
          },
        ),
      ],
    );
  }

  Column registrationNumber({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(
          title: widget.people.isIndividual
              ? localization.birthCertificateNumber
              : localization.registrationNumber,
        ),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: registrationNumberController,
        ),
      ],
    );
  }

  Column economicCodeBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.economicCode),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: economicCodeController,
        )
      ],
    );
  }

  Row row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.people.isIndividual
            ? personalNameBox(width: (widget.formWidth / 2) - 15)
            : companyNameBox(width: (widget.formWidth / 4) - 15),
        datePickerBox(width: (widget.formWidth / 4) - 50),
        bursType(width: (widget.formWidth / 4) - 50),
        isActiveBox(width: (widget.formWidth / 4) - 43),
      ],
    );
  }

  Column isActiveBox({required double width}) {
    List<String> items = [localization.active, localization.deactivate];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.access),
        titleInputSpacing,
        DropDownInput(
          enable: widget.isActive,
          width: width,
          value: widget.people.isActive ? items[0] : items[1],
          items: items,
          onChange: (value) {
            widget.people.updateIsActive(value == localization.active);
          },
        ),
      ],
    );
  }

  Column bursType({required double width}) {
    List<BursType> bursTypeList = baseDataModel.bursTypeList;

    BursType? selectedBursType = bursTypeList
        .firstWhere((element) => element.id == widget.people.bursType);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.stockMarketStatus),
        titleInputSpacing,
        (widget.people.isIndividual)
            ? Container(width: width)
            : GenericDropDown<BursType>(
                isEnable: widget.isActive,
                itemWidth: width,
                value: selectedBursType,
                items: bursTypeList,
                onChanged: (value) {
                  if (value != null) {
                    widget.people.bursType = value.id;
                  }
                },
              ),
      ],
    );
  }

  Column datePickerBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(
          title: widget.people.isIndividual
              ? localization.birthDate
              : localization.foundationDate,
        ),
        titleInputSpacing,
        InkWell(
          onTap: () async {
            String? selectDate = await JalaliDatePicker.getDate();
            datePickerController.value = TextEditingValue(text: selectDate!);
          },
          child: FormTextField(
            textHint: '1403/01/18',
            controller: datePickerController,
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: widget.iconColor,
                  size: 20,
                ),
                onPressed: () {}),
            enable: false,
            widgetWidth: width,
          ),
        ),
      ],
    );
  }

  Row personalNameBox({required double width}) {
    return Row(
      children: [
        firstNameBox(width / 2),
        lastNameBox(width / 2),
      ],
    );
  }

  Column lastNameBox(double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.lastName),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: lastNameController,
        )
      ],
    );
  }

  Column firstNameBox(double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.name),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: firstNameController,
        )
      ],
    );
  }

  Column companyNameBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.companyName),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: companyNameController,
        )
      ],
    );
  }
  Row row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        counterpartyTypeBox(width: (widget.formWidth / 4) - 50),
        prefixBox(width: (widget.formWidth / 4) - 50),
        nationalIDBox(width: (widget.formWidth / 4) - 12),
        counterpartyCode(width: (widget.formWidth / 4) - 12),
      ],
    );
  }

  Column counterpartyCode({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.counterpartyCode),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          textHint: localization.autoSelect,
          controller: codeController,
        ),
      ],
    );
  }

  Column nationalIDBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(
            title: widget.people.isIndividual
                ? localization.nationalCode
                : localization.nationalId),
        titleInputSpacing,
        FormTextField(
          controller: nationalCodeController,
          widgetWidth: width,
          suffixIcon: const Icon(
            Icons.add_circle,
            color: Color(0xFF9E79AC),
          ),
        ),
      ],
    );
  }

  Column prefixBox({required double width}) {
    List<Prefix> prefixList = baseDataModel.prefixList;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.prefix),
        titleInputSpacing,
        GenericDropDown<Prefix>(
          isEnable: widget.isActive,
          itemWidth: width,
          value: prefixList[0],
          items: prefixList,
          onChanged: (value) {
            if (value != null) {
              widget.people.prefixId = value.id;
            }
          },
        ),
      ],
    );
  }

  Column counterpartyTypeBox({required double width}) {
    List<PeopleCounterpartyType> counterpartyTypes = [
      PeopleCounterpartyType(id: 0, name: localization.individual),
      PeopleCounterpartyType(id: 1, name: localization.legal),
    ];
    PeopleCounterpartyType? selectedCounterpartyType = counterpartyTypes
        .firstWhere((element) => element.id == widget.people.type);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.counterpartyType),
        titleInputSpacing,
        GenericDropDown<PeopleCounterpartyType>(
          isEnable: widget.isActive,
          itemWidth: width,
          value: selectedCounterpartyType,
          items: counterpartyTypes,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                widget.people.type = value.id;
              });
            }
          },
        )
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

  otherFeaturesSection() {
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

  getCityName() {
    String cityName = '';
    if (widget.cityList != null) {
      for (City city in widget.cityList!) {
        if (widget.people.cityId == city.id) {
          cityName = city.name;
        }
      }
    }
    return cityName;
  }

  void checkState() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessCreateCounterparty ||
        state is SuccessUpdateCounterparty) {
      Navigator.of(context).pop();
    } else if (state is FailedUpdateCounterparty) {
      debugPrint('update CounterpartyPeople error: ${state.errorMessage}');
      //Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is FailedCreateCounterparty) {
      debugPrint('create CounterpartyPeople error: ${state.errorMessage}');
      // Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is LoadedCityList) {
      widget.cityList = state.cityList;
    }
  }
}

enum PeopleModalTab { details, otherFeatures, addresses, groups }
