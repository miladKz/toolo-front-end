import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/customer_data_detail.dart';

class CustomerDataDetailDto extends CustomerDataDetail {
  CustomerDataDetailDto(
      {required super.id,
      required super.moshtarianID,
      required super.parentID,
      required super.title,
      required super.value,
      required super.valueType});

  factory CustomerDataDetailDto.fromMap(Map<String, dynamic> map) {
    return CustomerDataDetailDto(
      id: map.findAsInt('ID'),
      title: map.findAsString("Title"),
      moshtarianID: map.findAsInt("MoshtarianID"),
      parentID: map.findAsInt("ParentID"),
      value: map.findAsString("Value"),
      valueType: map.findAsInt("ValueType"),
    );
  }
}
