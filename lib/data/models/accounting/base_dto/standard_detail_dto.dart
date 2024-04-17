import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';

class StandardDetailDto extends StandardDetail {
  StandardDetailDto(
      {required super.name,
      required super.id,
      required super.bargeTypeID,
      required super.description,
      required super.section});

  factory StandardDetailDto.fromMap(Map<String, dynamic> map) {
    return StandardDetailDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      bargeTypeID: map.findAsInt('BargeTypeID'),
      description: map.findAsString('Description'),
      section: map.findAsInt('Section'),
    );
  }
}