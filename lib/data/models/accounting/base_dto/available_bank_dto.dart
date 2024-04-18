import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../../domain/entities/base/available_bank_.dart';

class AvailableBankDto extends AvailableBank {
  AvailableBankDto(
      {required super.name, required super.code, required super.id});

  factory AvailableBankDto.fromMap(Map<String, dynamic> map) {
    return AvailableBankDto(
      id: map.findAsInt('ID'),
      code: map.findAsInt('Code'),
      name: map.findAsString("Name"),
    );
  }
}
