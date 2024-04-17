import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/person_type.dart';

class PersonTypeDto extends PersonType {
  PersonTypeDto({required super.name, required super.id});

  factory PersonTypeDto.fromMap(Map<String, dynamic> map) {
    return PersonTypeDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
    );
  }

}
