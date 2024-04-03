import 'abstracts/table_row_data_abs.dart';

class RevolvingFund extends ITableRowData {
  RevolvingFund({required super.id,required this.description});

  String description;

  @override
  List<Object?> get props => [description];
}
