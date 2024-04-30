import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/enums/customer_detail_type.dart';
import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/common/city.dart';

import '../../../../di/di.dart';
import '../../../../domain/entities/base/enums/people_counterparty_type.dart';
import '../../../../domain/entities/base/standard_detail.dart';
import '../../../../domain/entities/common/people.dart';
import '../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../factories/table_view_model_factory.dart';
import '../../../view_models/table_view_model.dart';
import '../jalali_date_picker.dart';
import '../snakbar.dart';
import 'modal_elements/check_box_form.dart';
import 'modal_elements/counterparty_detail_viewer.dart';
import 'modal_elements/drop_down_generic.dart';
import 'modal_elements/drop_down_input.dart';
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
  TextEditingController birthCertificateNumberController =
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
  TextEditingController brandNameController = TextEditingController(text: '');

  @override
  void initState() {
    widget.isUpdate = (widget.people.id > 0);
    super.initState();
    locator.get<MainBloc>().add(OnLoadCityList());
    locator.get<MainBloc>().add(OnLoadCompanyTypes());
    if (widget.isUpdate) {
      CustomerDataDetailParam customerDataDetailParam = CustomerDataDetailParam(
          customerId: widget.people.id,
          valueType: CustomerDetailType.additionalDetail);
      locator
          .get<MainBloc>()
          .add(OnLoadCustomerDetailList(customerDataDetailParam));

      customerDataDetailParam.valueType = CustomerDetailType.additionalAddress;
      locator
          .get<MainBloc>()
          .add(OnLoadCustomerDetailList(customerDataDetailParam));
    }
  }

  @override
  Widget build(BuildContext context) {
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

      birthCertificateNumberController =
          TextEditingController(text: widget.people.birthCertificateNumber);

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
      brandNameController = TextEditingController(text: widget.people.brand);
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

              widget.people.updateBirthCertificateNumber(
                  birthCertificateNumberController.text);

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

              widget.people.updateFoundationDate(datePickerController.text);

              widget.people.updateName(firstNameController.text);

              widget.people.updateLastName(lastNameController.text);

              widget.people.updateBrandName(brandNameController.text);

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
          Expanded(
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
          Expanded(
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
          dialogTitle: localization.descriptionOfDocuments,
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
        economicCodeBox(width: (widget.formWidth / 4) - 30),
        widget.people.isIndividual
            ? birthCertificateNumberBox(width: (widget.formWidth / 4) - 30)
            : registrationNumber(width: (widget.formWidth / 4) - 30),
        isActiveBox(width: (widget.formWidth / 4) - 50),
        customerStatus(width: (widget.formWidth / 4) - 50),
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
          title: localization.registrationNumber,
        ),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: registrationNumberController,
        ),
      ],
    );
  }

  Column birthCertificateNumberBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(
          title: localization.birthCertificateNumber,
        ),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          inputType: TextInputType.number,
          controller: birthCertificateNumberController,
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
            ? personalNameBox(width: (widget.formWidth / 2) - 30)
            : companyNameBox(width: (widget.formWidth / 4) - 30),
        datePickerBox(width: (widget.formWidth / 4) - 30),
        (widget.people.isIndividual)
            ? brandNameBox(width: (widget.formWidth / 4) - 30)
            : bursType(width: (widget.formWidth / 4) - 30),
        if (!widget.people.isIndividual) ...[
          companyKindModalOpenerButton(width: (widget.formWidth / 4) - 30)
        ]
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

  Column brandNameBox({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.brandName),
        titleInputSpacing,
        FormTextField(
          widgetWidth: width,
          controller: brandNameController,
        )
      ],
    );
  }

  Column bursType({required double width}) {
    List<BourseType> bursTypeList = baseDataModel.bourseTypeList;

    BourseType? selectedBursType = bursTypeList
        .firstWhere((element) => element.id == widget.people.bursType);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.stockMarketStatus),
        titleInputSpacing,
        GenericDropDown<BourseType>(
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
            widgetHeight: 38,
          ),
        ),
      ],
    );
  }

  SizedBox personalNameBox({required double width}) {
    return SizedBox(
      width: width,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstNameBox(width: width / 2 - 10),
          lastNameBox(width: width / 2 - 10),
        ],
      ),
    );
  }

  Column lastNameBox({required double width}) {
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

  Column firstNameBox({required double width}) {
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
        counterpartyTypeBox(width: (widget.formWidth / 4) - 30),
        prefixBox(width: (widget.formWidth / 4) - 30),
        nationalIDBox(width: (widget.formWidth / 4) - 30),
        counterpartyCode(width: (widget.formWidth / 4) - 30),
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
    print("ASDASDASDASDSADASDASD");
    return [
      FormItemTitle(
        title: localization.otherFeatures,
        textColor: const Color(0xFF6C3483),
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
      titleInputSpacing,
      CounterpartyDetailViewer(
        key: widget.key,
        items: widget.people.additionalDetailList
            .where((detail) =>
                detail.valueType == CustomerDetailType.additionalAddress.value)
            .toList(),
        addModalTitle: localization.addSpecifications,
        customerDetailType: CustomerDetailType.additionalAddress,
      ),
    ];
  }

  CounterpartyDetailViewer detailTable() {
    return CounterpartyDetailViewer(
      key: widget.key,
      items: widget.people.additionalDetailList
          .where((detail) =>
              detail.valueType == CustomerDetailType.additionalDetail.value)
          .toList(),
      addModalTitle: localization.addSpecifications,
      customerDetailType: CustomerDetailType.additionalDetail,
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

  Widget companyKindModalOpenerButton({required double width}) {
    String value = (widget.isUpdate) ? getCompanyTypeName() : '';
    DataTableViewModel? dataTableViewModel;
    MainBloc mainBloc = locator.get<MainBloc>();
    if (mainBloc.standardDetailList != null) {
      dataTableViewModel =
          DataTableViewModelFactory.createTableViewModelFromStandardDetailList(
              mainBloc.standardDetailList!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.relatedBank),
        titleInputSpacing,
        ModalOpenerButton(
          dialogTitle: localization.titleBankList,
          buttonWidth: width,
          formWidth: widget.formWidth - 200,
          value: value,
          formKey: widget._formKey,
          onSelectItemFromTableModal: (revolvingFoundType) {
            if (revolvingFoundType != null) {
              try {
                StandardDetail standardDetail =
                    revolvingFoundType as StandardDetail;
                widget.people.type = standardDetail.id;
              } catch (e) {
                debugPrint("cast failed: $e");
              }
            }
          },
          dataTableViewModel: dataTableViewModel,
        ),
      ],
    );
  }

  String getCompanyTypeName() {
    String revolvingFundName = '';
    MainBloc mainBloc = locator.get<MainBloc>();
    if (mainBloc.standardDetailList != null) {
      for (StandardDetail standardDetail in mainBloc.standardDetailList!) {
        if (widget.people.type == standardDetail.id) {
          revolvingFundName = standardDetail.description;
        }
      }
    }

    return revolvingFundName;
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
    } else if (state is SuccessCreateCustomerDetail) {
      if (state.counterpartyDetail.valueType ==
          CustomerDetailType.additionalDetail.value) {
        widget.people.additionalDetailList.add(state.counterpartyDetail);
      } else if (state.counterpartyDetail.valueType ==
          CustomerDetailType.additionalAddress.value) {
        widget.people.additionalDetailList.add(state.counterpartyDetail);
      }
    } else if (state is SuccessLoadCustomerDetail) {
      widget.people.additionalDetailList = state.detailList;
    } else if (state is SuccessLoadCustomerAddress) {
      widget.people.additionalDetailList = state.addressList;
    } else if (state is SuccessDeleteCustomerDetail) {
      if (state.counterpartyDetail.valueType ==
          CustomerDetailType.additionalDetail.value) {
        widget.people.additionalDetailList.remove(state.counterpartyDetail);
      } else if (state.counterpartyDetail.valueType ==
          CustomerDetailType.additionalAddress.value) {
        widget.people.additionalDetailList.remove(state.counterpartyDetail);
      }
    }
  }
}

enum PeopleModalTab { details, otherFeatures, addresses, groups }
