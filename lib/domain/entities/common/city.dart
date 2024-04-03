import 'abstracts/table_row_data_abs.dart';

class City extends ITableRowData {
  City({
    required super.id,
    required this.code,
    required this.name,
    required this.province,
  });

  int code;
  String province;
  String name;

  @override
  List<Object?> get props => [code, name, province];
}