import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../domain/entities/common/counterparty_detail.dart';

class CounterpartyDetailDto extends CounterpartyDetail {
  CounterpartyDetailDto({
    required super.id,
    required super.name,
    required super.counterpartyId,
    required super.parentId,
    required super.value,
    required super.valueType,
  });

  factory CounterpartyDetailDto.fromMap(Map<String, dynamic> map) {
    return CounterpartyDetailDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Title"),
      counterpartyId: map.findAsInt("MoshtarianID"),
      parentId: map.findAsInt("ParentID"),
      value: map.findAsString("Value"),
      valueType: map.findAsInt("ValueType"),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': (id > 0) ? id : null,
      'Title': name,
      'MoshtarianID': counterpartyId,
      'ParentID': parentId,
      'Value': value,
      'ValueType': valueType,
    }..removeWhere(
        (dynamic key, dynamic value) => value == '' || value == null);
  }
}
