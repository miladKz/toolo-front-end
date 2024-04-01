import 'abstracts/table_row_data.dart';

class City extends TableRowData {
  City({
    required this.id,
    required this.name,
    required this.province,
  });

  int id;
  String province;
  String name;

  @override
  List<Object?> get props => [id, name, province];
}