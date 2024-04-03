import '../../domain/entities/common/abstracts/table_row_data_abs.dart';

class DataTableViewModel {
  List<String> labels;
  List<ITableRowData> data;

  DataTableViewModel({required this.labels, required this.data});
}
