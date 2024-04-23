
import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';

class BourseTypeDto extends BursType {
  BourseTypeDto({required super.name, required super.id});

  factory BourseTypeDto.fromMap(Map<String, dynamic> map) {
    return BourseTypeDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),);
  }

}