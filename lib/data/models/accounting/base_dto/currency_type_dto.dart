import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';

class CurrencyTypeDto extends CurrencyType {
  CurrencyTypeDto(
      {required super.name,
      required super.id,
      required super.neshaneNumber,
      required super.neshaneStr,
      required super.rowNumber});

  factory CurrencyTypeDto.fromMap(Map<String, dynamic> map) {
    return CurrencyTypeDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      neshaneNumber: map.findAsInt("NeshaneNumber"),
      neshaneStr: map.findAsString("NeshaneStr"),
      rowNumber: map.findAsInt("RowNumber"),
    );
  }
}
