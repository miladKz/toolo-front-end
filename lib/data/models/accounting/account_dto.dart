import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';

class AccountDto extends Account {
  const AccountDto(
      {required super.id,
      required super.accCode1,
      required super.accCode2,
      required super.accCode3,
      required super.accCode4,
      required super.accountLevel,
      required super.accountcd,
      required super.canDel,
      required super.description,
      required super.groupCode,
      required super.hasPooli,
      required super.hasTafzili,
      required super.hasTaseir,
      required super.indexOrder1,
      required super.indexOrder2,
      required super.isActive,
      required super.isAmalyati,
      super.items = const [],
      required super.type,
      required super.mahiatRialy,
      required super.balanceSheetType});

  factory AccountDto.fromMap(Map<String, dynamic> map) {
    return AccountDto(
      id: map.findAsInt('ID'),
      accCode1: map.findAsString("AccCode1"),
      accCode2: map.findAsString("AccCode2"),
      accCode3: map.findAsString("AccCode3"),
      accCode4: map.findAsString("AccCode4"),
      accountLevel: map.findAsInt("AccountLevel"),
      accountcd: map.findAsString("Accountcd"),
      canDel: map.findAsBool("CanDel"),
      description: map.findAsString("Description"),
      groupCode: map.findAsString("GroupCode"),
      hasPooli: map.findAsBool("HasPooli"),
      hasTafzili: map.findAsBool("HasTafzili"),
      hasTaseir: map.findAsBool("HasTaseir"),
      indexOrder1: map.findAsInt("IndexOrder1"),
      indexOrder2: map.findAsInt("IndexOrder2"),
      isActive: map.findAsBool("IsActive"),
      isAmalyati: map.findAsBool("IsAmalyati"),
      items: map.findAsDynamic("Items"),
      type: map.findAsInt("Mahiat"),
      mahiatRialy: map.findAsBool("MahiatRialy"),
      balanceSheetType: map.findAsInt("TaraznameType"),
    );
  }
}
