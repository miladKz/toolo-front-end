import 'abstracts/table_row_data_abs.dart';

class CounterpartyDetail extends ITableRowData {
  CounterpartyDetail({
    required super.id,
    required super.name,
    required this.counterpartyId,
    required this.parentId,
    required this.value,
    required this.valueType,
  });

  int counterpartyId;
  int parentId;
  int valueType;
  String value;

  @override
  List<Object?> get props => [name, value];
}
