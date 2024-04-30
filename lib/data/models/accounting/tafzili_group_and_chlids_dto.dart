import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/tafzili_group_child_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_and_child.dart';

class TafziliGroupAndChildrenDto extends TafziliGroupAndChildren {
  TafziliGroupAndChildrenDto(
      {required super.id,
      required super.code,
      required super.name,
      required super.type,
      required super.tafziliList});

  factory TafziliGroupAndChildrenDto.fromMap(Map<String, dynamic> map) {
    return TafziliGroupAndChildrenDto(
      id: map.findAsInt('ID'),
      name: map.findAsString('Name'),
      code: map.findAsString('code'),
      type: map.findAsInt('type'),
      tafziliList: getTafziliChildList(map),
    );
  }

  static List<TafziliGroupChildDto> getTafziliChildList(
      Map<String, dynamic> map) {
    final itemsMap = map.findAsDynamic("Items");
    List<TafziliGroupChildDto> tafziliChildList = List.empty(growable: true);
    for (var itemMap in itemsMap) {
      tafziliChildList.add(TafziliGroupChildDto.fromMap(itemMap));
    }
    return tafziliChildList;
  }
}
