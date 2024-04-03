import 'abstracts/table_row_data_abs.dart';

class ManageCarsReader extends ITableRowData {
  ManageCarsReader({
    required super.id,
    required this.code,
    required this.name,
    required this.currencyType,
    required this.description,
  });

  int code;
  String name;
  String currencyType;
  String description;

  @override
  List<Object?> get props => [code,name,currencyType,description];
}