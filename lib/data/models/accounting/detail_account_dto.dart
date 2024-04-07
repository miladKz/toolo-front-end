import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../domain/entities/accounting/detail_account.dart';

class DetailAccountDto extends DetailAccount {
  DetailAccountDto({
    required super.displayName,
    required super.id,
    required super.hasChildren,
    required super.children,
    required super.isActive,
    required super.code,
    required super.description,
    required super.isStaff,
    required super.isCustomer,
    required super.isInvestee,
    required super.isOther,
    required super.isPartner,
    required super.isSupply,
    required super.isFacilitator,
    required super.isReceiverFacility,
    required super.isDependent,
    required super.isIntermediary,
    required super.detailedGroupCode,
  });

  factory DetailAccountDto.fromMap(Map<String, dynamic> map) {
    return DetailAccountDto(
        id: map.findAsInt('ID'),
        displayName: map.findAsString("Name"),
        isActive: map.findAsBool("Active"),
        code: map.findAsString("Code"),
        description: map.findAsString("Description"),
        isStaff: map.findAsBool("IsKarkonan"),
        isCustomer: map.findAsBool("IsMoshtari"),
        isInvestee: map.findAsBool("IsSarmayePazir"),
        isOther: map.findAsBool("IsSayer"),
        isPartner: map.findAsBool("IsShoraka"),
        isSupply: map.findAsBool("IsTamin"),
        isFacilitator: map.findAsBool("IsTashilatDahande"),
        isReceiverFacility: map.findAsBool("IsTashilatGirande"),
        isDependent: map.findAsBool("IsVabaste"),
        isIntermediary: map.findAsBool("IsVasete"),
        detailedGroupCode: map.findAsInt("TafziliGroupCode"),
        hasChildren: false,
        children: []);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': (id != 0) ? id : null,
      'Name': displayName,
      'Active': isActive,
      'Code': code,
      'Description': description,
      'IsKarkonan': isStaff,
      'IsMoshtari': isCustomer,
      'IsSarmayePazir': isInvestee,
      'IsSayer': isOther,
      'IsShoraka': isPartner,
      'IsTamin': isSupply,
      'IsTashilatDahande': isFacilitator,
      'IsTashilatGirande': isReceiverFacility,
      'IsVabaste': isDependent,
      'IsVasete': isIntermediary,
      'TafziliGroupCode': detailedGroupCode,
    }..removeWhere(
        (dynamic key, dynamic value) => value == '' || value == null);
  }

  Map<String, dynamic> idToMap() {
    return <String, dynamic>{
      'id': id,
    };
  }
}
