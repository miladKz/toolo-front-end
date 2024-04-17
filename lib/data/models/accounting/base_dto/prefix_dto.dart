import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';

class PrefixDto extends Prefix {
  PrefixDto(
      {required super.name, required super.id, required super.personTypeID});

  factory PrefixDto.fromMap(Map<String, dynamic> map) {
    return PrefixDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      personTypeID: map.findAsInt('PersonTypeID'),
    );
  }
}
