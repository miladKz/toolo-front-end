import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../domain/entities/fiscal/fiscal_year.dart';

class FiscalYearDto extends FiscalYear {
  FiscalYearDto(
      {required super.id,
      required super.databaseID,
      required super.displayName,
      required super.activeYearName});

  factory FiscalYearDto.fromMap(Map<String, dynamic> map) {
    return FiscalYearDto(
      id: map.findAsInt('ID'),
      databaseID: map.findAsInt('DatabaseID'),
      displayName: map.findAsString('DisplayName'),
      activeYearName: map.findAsString('ActiveYear'),
    );
  }
}
