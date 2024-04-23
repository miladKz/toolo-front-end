import 'abstracts/table_row_data_abs.dart';

class City extends ITableRowData {
  City({
    required super.id,
    required this.cityCode,
    required this.fullCode,
    required this.stateCode,
    required super.name,
    required this.fullName,
    required this.stateName,
  });

  String cityCode;
  String fullCode;
  String fullName;
  String stateCode;
  String stateName;


  @override
  List<Object?> get props => [fullCode, name, stateName];
}
