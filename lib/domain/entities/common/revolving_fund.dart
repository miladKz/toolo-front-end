import 'abstracts/table_row_data.dart';

class RevolvingFund extends TableRowData {
  RevolvingFund({required this.description});

  String description;

  @override
  List<Object?> get props => [description];
}
