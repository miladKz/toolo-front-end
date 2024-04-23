import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../domain/entities/common/counterparty.dart';

class CounterpartyDto extends Counterparty {
  CounterpartyDto({
    required super.id,
    required super.address,
    required super.currencyType,
    required super.bankAccType,
    required super.bankCardNumber,
    required super.bursType,
    required super.cityId,
    required super.code,
    required super.nationalCode,
    required super.postalCode,
    required super.companyName,
    required super.sharePercentage,
    required super.foundationDate,
    required super.description,
    required super.chequeCredit,
    required super.rialCredit,
    required super.fax,
    required super.firstName,
    required super.groupValueId,
    required super.responsibleBoard,
    required super.isActive,
    required super.isBoardMember,
    required super.isEmployee,
    required super.isCustomer,
    required super.isInvestor,
    required super.isOtherParty,
    required super.isShareholder,
    required super.isSupplier,
    required super.isLender,
    required super.isBorrower,
    required super.isDependent,
    required super.isIntermediary,
    required super.kind,
    required super.lastName,
    required super.name,
    required super.parentId,
    required super.passportNumber,
    required super.prefixId,
    required super.jobTitle,
    required super.shebaNumber,
    required super.registrationNumber,
    required super.nationality,
    required super.detailId,
    required super.phone,
    required super.type,
    required super.customerStatus,
  });

  factory CounterpartyDto.fromMap(Map<String, dynamic> map) {
    return CounterpartyDto(
      id: map.findAsInt('ID'),
      address: map.findAsString('Address'),
      currencyType: map.findAsInt('ArzTypeID'),
      bankAccType: map.findAsInt('BankAccType'),
      bankCardNumber: map.findAsString('BankCardNumber'),
      bursType: map.findAsInt('BoorsType'),
      cityId: map.findAsInt('CityID'),
      code: map.findAsInt('Code'),
      nationalCode: map.findAsString('CodeMeli'),
      postalCode: map.findAsString('CodePosti'),
      companyName: map.findAsString('CompanyName'),
      sharePercentage: map.findAsInt('DarsadSaham'),
      foundationDate: DateTime.parse(map.findAsString('DateTasis')),
      description: map.findAsString('Descriptions'),
      chequeCredit: map.findAsInt('EtebarCheck'),
      rialCredit: map.findAsInt('EtebarRial'),
      fax: map.findAsString('Fax'),
      firstName: map.findAsString('FirstName'),
      groupValueId: map.findAsInt('GroupValueID'),
      responsibleBoard: map.findAsString('HeiatModireMasouliat'),
      isActive: map.findAsBool('IsActive'),
      isBoardMember: map.findAsBool('IsHeiatModire'),
      isEmployee: map.findAsBool('IsKarkonan'),
      isCustomer: map.findAsBool('IsMoshtari'),
      isInvestor: map.findAsBool('IsSarmayePazir'),
      isOtherParty: map.findAsBool('IsSayer'),
      isShareholder: map.findAsBool('IsShoraka'),
      isSupplier: map.findAsBool('IsTamin'),
      isLender: map.findAsBool('IsTashilatDahande'),
      isBorrower: map.findAsBool('IsTashilatGirande'),
      isDependent: map.findAsBool('IsVabaste'),
      isIntermediary: map.findAsBool('IsVasete'),
      kind: map.findAsInt('Kind'),
      lastName: map.findAsString('LastName'),
      name: map.findAsString('Name'),
      parentId: map.findAsInt('ParentID'),
      passportNumber: map.findAsString('PassportNumber'),
      prefixId: map.findAsInt('PrefixID'),
      jobTitle: map.findAsString('Semat'),
      shebaNumber: map.findAsString('ShabaNumber'),
      registrationNumber: map.findAsString('ShomareSabt'),
      nationality: map.findAsString('Tabeyat'),
      detailId: map.findAsInt('TafziliID'),
      phone: map.findAsString('Tel'),
      type: map.findAsInt('Types'),
      customerStatus: map.findAsInt('CustomerStatus'),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': (id != 0) ? id : null,
      'Address': address.toString(),
      'BankAccType': bankAccType,
      'BankCardNumber': bankCardNumber.toString(),
      'BoorsType': bursType,
      'CityID': cityId,
      'Code': code,
      'CodeMeli': nationalCode.toString(),
      'CodePosti': postalCode.toString(),
      'CompanyName': companyName.toString(),
      'DarsadSaham': sharePercentage,
      'DateTasis': formatDateTime(foundationDate).toString(),
      'Descriptions': description.toString(),
      'EtebarCheck': chequeCredit,
      'EtebarRial': rialCredit,
      'Fax': fax.toString(),
      'FirstName': firstName.toString(),
      'GroupValueID': groupValueId,
      'HeiatModireMasouliat': responsibleBoard.toString(),
      'IsActive': isActive,
      'IsHeiatModire': isBoardMember,
      'IsKarkonan': isEmployee,
      'IsMoshtari': isCustomer,
      'IsSarmayePazir': isInvestor,
      'IsSayer': isOtherParty,
      'IsShoraka': isShareholder,
      'IsTamin': isSupplier,
      'IsTashilatDahande': isLender,
      'IsTashilatGirande': isBorrower,
      'IsVabaste': isDependent,
      'IsVasete': isIntermediary,
      'Kind': kind,
      'LastName': lastName.toString(),
      'Name': name.toString(),
      'ParentID': parentId,
      'PassportNumber': passportNumber.toString(),
      'PrefixID': prefixId,
      'Semat': jobTitle.toString(),
      'ShabaNumber': shebaNumber.toString(),
      'ShomareSabt': registrationNumber.toString(),
      'Tabeyat': nationality.toString(),
      'TafziliID': detailId,
      'Tel': phone.toString(),
      'Types': type,
      'ArzTypeID': currencyType,
      'CustomerStatus': customerStatus
    }..removeWhere((dynamic key, dynamic value) =>
        (key == "id" && value == 0) || value == null);
  }

  String formatDateTime(DateTime dateTime) {
    // Formatting the date and time components
    //String formattedDate = dateTime.toIso8601String();
    String formattedDate =
        '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    // Returning the formatted date string
    return formattedDate;
  }
}
