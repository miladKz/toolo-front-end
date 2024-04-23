import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../../domain/entities/common/city.dart';

class CityDto extends City {
  CityDto({
    required super.name,
    required super.id,
    required super.cityCode,
    required super.fullCode,
    required super.fullName,
    required super.stateCode,
    required super.stateName,
  });

  factory CityDto.fromMap(Map<String, dynamic> map) {
    return CityDto(
      id: map.findAsInt('ID'),
      name: map.findAsString('CityName'),
      cityCode: map.findAsString('CityCode'),
      fullCode: map.findAsString('FullCode'),
      fullName: map.findAsString('FullName'),
      stateCode: map.findAsString('StateCode'),
      stateName: map.findAsString('StateName'),
    );
  }
}
