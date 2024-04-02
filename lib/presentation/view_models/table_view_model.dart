import '../../domain/entities/common/abstracts/table_row_data.dart';

class TableViewModel {
  List<String> labels;
  List<TableRowData> data;

  TableViewModel({required this.labels, required this.data});
}
