import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';

class DetailGroupRootDto extends DetailGroupRoot {
  DetailGroupRootDto(
      {required super.name,
      required super.id,
      required super.code,
      required super.type});

  factory DetailGroupRootDto.fromMap(Map<String, dynamic> map) {
    return DetailGroupRootDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      code: map.findAsInt("Code"),
      type: map.findAsInt("Type"),
    );
  }
}
