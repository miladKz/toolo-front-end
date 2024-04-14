import 'abstracts/table_row_data_abs.dart';

class Counterparty extends ITableRowData {
  String address;
  int bankAccType;
  String bankCardNumber;
  int exchangeType;
  int cityId;
  int code;
  String nationalCode;
  String postalCode;
  String companyName;
  int sharePercentage;
  DateTime foundationDate;
  String description;
  int creditCheck;
  int creditRial;
  String fax;
  String firstName;
  int groupValueId;
  String responsibleBoard;
  bool isActive;
  bool isBlackList;
  bool isBoardMember;
  bool isStaff;
  bool isCustomer;
  bool isInvestee;
  bool isOther;
  bool isPartner;
  bool isSupply;
  bool isFacilitator;
  bool isReceiverFacility;
  bool isDependent;
  bool isIntermediary;
  int kind;
  String lastName;
  String name;
  int parentId;
  String passportNumber;
  int prefixId;
  String jobTitle;
  String shebaNumber;
  String registrationNumber;
  String nationality;
  int detailId;
  String tel;
  int type;

  Counterparty(
      {required super.id,
      required this.address,
      required this.bankAccType,
      required this.bankCardNumber,
      required this.exchangeType,
      required this.cityId,
      required this.code,
      required this.nationalCode,
      required this.postalCode,
      required this.companyName,
      required this.sharePercentage,
      required this.foundationDate,
      required this.description,
      required this.creditCheck,
      required this.creditRial,
      required this.fax,
      required this.firstName,
      required this.groupValueId,
      required this.responsibleBoard,
      required this.isActive,
      required this.isBlackList,
      required this.isBoardMember,
      required this.isStaff,
      required this.isCustomer,
      required this.isInvestee,
      required this.isOther,
      required this.isPartner,
      required this.isSupply,
      required this.isFacilitator,
      required this.isReceiverFacility,
      required this.isDependent,
      required this.isIntermediary,
      required this.kind,
      required this.lastName,
      required this.name,
      required this.parentId,
      required this.passportNumber,
      required this.prefixId,
      required this.jobTitle,
      required this.shebaNumber,
      required this.registrationNumber,
      required this.nationality,
      required this.detailId,
      required this.tel,
      required this.type});

  factory Counterparty.empty() {
    return Counterparty(
      id: -1,
      code: -1,
      kind: -1,
      address: '',
      bankAccType: -1,
      bankCardNumber: '',
      exchangeType: -1,
      cityId: -1,
      nationalCode: '',
      postalCode: '',
      companyName: '',
      sharePercentage: -1,
      foundationDate: DateTime.now(),
      description: '',
      creditCheck: -1,
      creditRial: -1,
      fax: '',
      firstName: '',
      groupValueId: -1,
      responsibleBoard: '',
      isActive: false,
      isBlackList: false,
      isBoardMember: false,
      isStaff: false,
      isCustomer: false,
      isInvestee: false,
      isOther: false,
      isPartner: false,
      isSupply: false,
      isFacilitator: false,
      isReceiverFacility: false,
      isDependent: false,
      isIntermediary: false,
      lastName: '',
      name: '',
      parentId: -1,
      passportNumber: '',
      prefixId: -1,
      jobTitle: '',
      shebaNumber: '',
      registrationNumber: '',
      nationality: '',
      detailId: -1,
      tel: '',
      type: -1,
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
      exchangeType: exchangeType,
      cityId: cityId,
      nationalCode: nationalCode,
      postalCode: postalCode,
      companyName: companyName,
      sharePercentage: sharePercentage,
      foundationDate: foundationDate,
      description: description,
      creditCheck: creditCheck,
      creditRial: creditRial,
      fax: fax,
      firstName: firstName,
      groupValueId: groupValueId,
      responsibleBoard: responsibleBoard,
      isActive: isActive,
      isBlackList: isBlackList,
      isBoardMember: isBoardMember,
      isStaff: isStaff,
      isCustomer: isCustomer,
      isInvestee: isInvestee,
      isOther: isOther,
      isPartner: isPartner,
      isSupply: isSupply,
      isFacilitator: isFacilitator,
      isReceiverFacility: isReceiverFacility,
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
      tel: tel,
      type: type,
    );
  }


  void updateCode(int newCode) {
    if (newCode != 0) {
      code = newCode;
    }
  }

  void updateName(String newName) {
    if (newName.isNotEmpty) {
      name = newName;
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
      firstName = newAccountOwnerName;
    }
  }

  void updateCurrencyType(String newCurrencyType) {
    if (newCurrencyType.isNotEmpty) {
      nationalCode = newCurrencyType;
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
      bankAccType = newBankId;
    }
  }

  void updateDescription(String newDescription) {
    if (newDescription.isNotEmpty) {
      description = newDescription;
    }
  }
}
