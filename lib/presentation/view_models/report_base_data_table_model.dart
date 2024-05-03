import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class ReportBaseDataTableModel extends ITableRowData{
  ReportBaseDataTableModel({required super.id, required super.name});

  @override
  List<Object?> get props => [name];
}