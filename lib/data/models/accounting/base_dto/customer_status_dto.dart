import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';

class CustomerStatusDto extends CustomerStatus {
  CustomerStatusDto({required super.name, required super.id});

  factory CustomerStatusDto.fromMap(Map<String, dynamic> map) {
    return CustomerStatusDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
    );
  }
}
