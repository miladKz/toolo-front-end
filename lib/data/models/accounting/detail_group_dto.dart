import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/detail_account_dto.dart';

import '../../../domain/entities/accounting/detail_account.dart';
import '../../../domain/entities/accounting/detail_group.dart';

class DetailGroupDto extends DetailGroup {
  DetailGroupDto({
    required super.id,
    required super.name,
    required super.code,
    required super.type,
    required super.children,
  });

  factory DetailGroupDto.fromMap(Map<String, dynamic> map) {
    return DetailGroupDto(
        id: map.findAsInt('ID'),
        name: map.findAsString("Name"),
        type: map.findAsInt("Type"),
        code: map.findAsString("Code"),
        children:map['Items'] != null ? _getItems(map) : List.empty(growable: true),);
  }

  static List<DetailAccountDto> _getItems(Map<String, dynamic> map){
    List<dynamic> childrenData = map.findAsDynamic("Items");
    List<DetailAccountDto> items = List.empty(growable: true);
    for (var childMap in childrenData) {
      items.add(DetailAccountDto.fromMap(childMap));
    }
    return items;
  }

  Map<String, dynamic> toMap() {
    //todo: add items to map if needed
    return <String, dynamic>{
      'ID': (id != 0) ? id : null,
      'Name': name,
      'Code': code,
      'Type': type,
    }..removeWhere(
        (dynamic key, dynamic value) => value == '' || value == null);
  }

  Map<String, dynamic> idToMap() {
    return <String, dynamic>{
      'id': id,
    };
  }
}
