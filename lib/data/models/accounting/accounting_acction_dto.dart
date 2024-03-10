import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../domain/entities/accounting/accounting_action.dart';

class AccountingActionDto extends AccountingAction {
  const AccountingActionDto(
      {required super.id,
      required super.actionCode,
      required super.actionName,
      required super.code,
      required super.categoryIndex,
      required super.description,
      required super.hasChildren,
      required super.levelIndex,
      required super.orderIndex,
      required super.parentCode,
      required super.endPoint,
      required super.children});

 factory AccountingActionDto.fromMap(Map<String, dynamic> map) {
     return AccountingActionDto(
        id: map.findAsInt("ID"),
        actionCode: map.findAsString("ActionCode"),
        actionName: map.findAsString("ActionName"),
        code: map.findAsString("Code"),
        categoryIndex: map.findAsInt("CategoryIndex"),
        description: map.findAsString("Descriptions"),
        hasChildren: (map.findAsDynamic("Items") as List).isNotEmpty,
        children: _getChildren(map),
        levelIndex: map.findAsInt("LevelIndex"),
        orderIndex: map.findAsInt("OrderIndex"),
        endPoint:  map.findAsString("EndPoint"),
        parentCode: map.findAsString("ParentCode"));
  }

 static List<AccountingAction> _getChildren(Map<String, dynamic> map){
    List<dynamic> childrenData = map.findAsDynamic("Items");
    List<AccountingActionDto> children = [];
    for (var childMap in childrenData) {
      children.add(AccountingActionDto.fromMap(childMap));
    }
    return children;
  }

}
