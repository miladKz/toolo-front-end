import '../../../presentation/widgets/common/jalali_date_picker.dart';
import 'abstracts/table_row_data_abs.dart';
import 'counterparty_detail.dart';

class Counterparty extends ITableRowData {
  int currencyType;
  String address;
  int bankAccType;
  String bankCardNumber;
  int bursType;
  int customerStatus;
  int cityId;
  int code;
  String nationalCode;
  String postalCode;
  String companyName;
  int sharePercentage;
  DateTime foundationDate;
  String description;
  int chequeCredit;
  int rialCredit;
  String fax;
  String firstName;
  int groupValueId;
  String responsibleBoard;
  bool isActive;
  bool isBoardMember;
  bool isEmployee;
  bool isCustomer;
  bool isInvestor;
  bool isOtherParty;
  bool isShareholder;
  bool isSupplier;
  bool isLender;
  bool isBorrower;
  bool isDependent;
  bool isIntermediary;
  int kind;
  String lastName;
  int parentId;
  String passportNumber;
  int prefixId;
  String jobTitle;
  String shebaNumber;
  String registrationNumber;
  String nationality;
  int detailId;
  String phone;
  String economicCode;
  String birthCertificateNumber;
  String brand;
  int type;

  CounterpartyDetail? counterpartyDetail;

  Counterparty({
    required super.id,
    required this.address,
    required this.bankAccType,
    required this.bankCardNumber,
    required this.bursType,
    required this.customerStatus,
    required this.cityId,
    required this.code,
    required this.nationalCode,
    required this.postalCode,
    required this.companyName,
    required this.sharePercentage,
    required this.foundationDate,
    required this.description,
    required this.chequeCredit,
    required this.rialCredit,
    required this.fax,
    required this.firstName,
    required this.groupValueId,
    required this.responsibleBoard,
    required this.isActive,
    required this.isBoardMember,
    required this.isEmployee,
    required this.isCustomer,
    required this.isInvestor,
    required this.isOtherParty,
    required this.isShareholder,
    required this.isSupplier,
    required this.isLender,
    required this.isBorrower,
    required this.isDependent,
    required this.isIntermediary,
    required this.kind,
    required this.lastName,
    required super.name,
    required this.parentId,
    required this.passportNumber,
    required this.prefixId,
    required this.jobTitle,
    required this.shebaNumber,
    required this.registrationNumber,
    required this.nationality,
    required this.detailId,
    required this.phone,
    required this.type,
    required this.currencyType,
    required this.brand,
    required this.economicCode,
    required this.birthCertificateNumber,
    this.counterpartyDetail,
  });

  factory Counterparty.empty() {
    return Counterparty(
      id: 0,
      code: 0,
      kind: 0,
      address: '',
      bankAccType: 0,
      bankCardNumber: '',
      bursType: 0,
      cityId: 1,
      nationalCode: '',
      postalCode: '',
      companyName: '',
      sharePercentage: 0,
      foundationDate: DateTime.now(),
      description: '',
      chequeCredit: 0,
      rialCredit: 0,
      fax: '',
      firstName: '',
      groupValueId: 13,
      responsibleBoard: '',
      isActive: false,
      isBoardMember: false,
      isEmployee: false,
      isCustomer: false,
      isInvestor: false,
      isOtherParty: false,
      isShareholder: false,
      isSupplier: false,
      isLender: false,
      isBorrower: false,
      isDependent: false,
      isIntermediary: false,
      lastName: '',
      name: '',
      parentId: 0,
      passportNumber: '',
      prefixId: 1,
      jobTitle: '',
      shebaNumber: '',
      registrationNumber: '',
      nationality: '',
      detailId: 1,
      phone: '',
      type: 0,
      currencyType: 0,
      customerStatus: 0,
      birthCertificateNumber: '',
      brand: '',
      economicCode: '',
    );
  }

  Counterparty copy() {
    return Counterparty(
        id: id,
        code: code,
        kind: kind,
        address: address,
        bankAccType: bankAccType,
        bankCardNumber: bankCardNumber,
        bursType: bursType,
        cityId: cityId,
        nationalCode: nationalCode,
        postalCode: postalCode,
        companyName: companyName,
        sharePercentage: sharePercentage,
        foundationDate: foundationDate,
        description: description,
        chequeCredit: chequeCredit,
        rialCredit: rialCredit,
        fax: fax,
        firstName: firstName,
        groupValueId: groupValueId,
        responsibleBoard: responsibleBoard,
        isActive: isActive,
        isBoardMember: isBoardMember,
        isEmployee: isEmployee,
        isCustomer: isCustomer,
        isInvestor: isInvestor,
        isOtherParty: isOtherParty,
        isShareholder: isShareholder,
        isSupplier: isSupplier,
        isLender: isLender,
        isBorrower: isBorrower,
        isDependent: isDependent,
        isIntermediary: isIntermediary,
        lastName: lastName,
        name: name,
        parentId: parentId,
        passportNumber: passportNumber,
        prefixId: prefixId,
        jobTitle: jobTitle,
        shebaNumber: shebaNumber,
        registrationNumber: registrationNumber,
        nationality: nationality,
        detailId: detailId,
        phone: phone,
        type: type,
        currencyType: currencyType,
        customerStatus: customerStatus,
        birthCertificateNumber: birthCertificateNumber,
        brand: brand,
        economicCode: economicCode,
        counterpartyDetail: counterpartyDetail);
  }

  void updateCode(int newCode) {
    if (newCode != 0) {
      code = newCode;
    }
  }

  void updateNationalCode(String newNationalCode) {
    if (newNationalCode.isNotEmpty) {
      nationalCode = newNationalCode;
    }
  }

  void updateCompanyName(String newCompanyName) {
    if (newCompanyName.isNotEmpty) {
      companyName = newCompanyName;
    }
  }

  void updateRegistrationNumber(String newRegistrationNumber) {
    if (newRegistrationNumber.isNotEmpty) {
      registrationNumber = newRegistrationNumber;
    }
  }

  void updatePostalCode(String newPostalCode) {
    if (newPostalCode.isNotEmpty) {
      postalCode = newPostalCode;
    }
  }

  void updateAddress(String newAddress) {
    if (newAddress.isNotEmpty) {
      address = newAddress;
    }
  }

  void updatePhone(String newPhone) {
    if (newPhone.isNotEmpty) {
      phone = newPhone;
    }
  }

  void updateFax(String newFax) {
    if (newFax.isNotEmpty) {
      fax = newFax;
    }
  }

  void updateFoundationDate(String newFoundationDate) {
    if (newFoundationDate.isNotEmpty) {
      DateTime gregorianDateTime =
          JalaliDatePicker.toGregorian(newFoundationDate);
      foundationDate = gregorianDateTime;
    }
  }

  void updateRialCredit(int newRialCredit) {
    rialCredit = newRialCredit;
  }

  void updateChequeCredit(int newChequeCredit) {
    chequeCredit = newChequeCredit;
  }

  void updateName(String newName) {
    if (newName.isNotEmpty) {
      name = newName;
    }
  }

  void updateLastName(String newLastName) {
    if (newLastName.isNotEmpty) {
      lastName = newLastName;
    }
  }

  void updateEconomicCode(String newEconomicCode) {
    if (newEconomicCode.isNotEmpty) {
      economicCode = newEconomicCode;
    }
  }

  void updateCityId(int cityId) {
    if (cityId > 0) {
      this.cityId = cityId;
    }
  }

  void updateBranchName(String newBranchName) {
    if (newBranchName.isNotEmpty) {
      name = newBranchName;
    }
  }

  void updateAccountNumber(String newAccountNumber) {
    if (newAccountNumber.isNotEmpty) {
      nationalCode = newAccountNumber;
    }
  }

  void updateAccountOwnerName(String newAccountOwnerName) {
    if (newAccountOwnerName.isNotEmpty) {
      lastName = newAccountOwnerName;
    }
  }

  void updateCurrencyType(int newCurrencyType) {
    if (newCurrencyType > 0) {
      currencyType = newCurrencyType;
    }
  }

  void updateBranchCode(String newBranchCode) {
    if (newBranchCode.isNotEmpty) {
      bankCardNumber = newBranchCode;
    }
  }

  void updateCardNumber(String newCardNumber) {
    if (newCardNumber.isNotEmpty) {
      bankCardNumber = newCardNumber;
    }
  }

  void updateShebaNumber(String newShebaNumber) {
    if (newShebaNumber.isNotEmpty) {
      bankCardNumber = newShebaNumber;
    }
  }

  void updateFirstName(String newFirstName) {
    if (newFirstName.isNotEmpty) {
      firstName = newFirstName;
    }
  }

  void updateBirthCertificateNumber(String newBirthCertificateNumber) {
    if (newBirthCertificateNumber.isNotEmpty) {
      birthCertificateNumber = newBirthCertificateNumber;
    }
  }

  void updateBrandName(String newBrand) {
    if (newBrand.isNotEmpty) {
      birthCertificateNumber = newBrand;
    }
  }

  void updateIsActive(bool newIsActive) {
    isActive = newIsActive;
  }

  void updateDetailCode(int newDetailCode) {
    if (newDetailCode != 0) {
      code = newDetailCode;
    }
  }

  void updateBankId(int newBankId) {
    if (newBankId != 0) {
      parentId = newBankId;
    }
  }

  void updateDescription(String newDescription) {
    if (newDescription.isNotEmpty) {
      description = newDescription;
    }
  }
}
