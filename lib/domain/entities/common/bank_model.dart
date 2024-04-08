import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class BankModel extends ITableRowData {
  const BankModel({
    required super.id,
    required this.name,
    required this.code,
  });

  final int code;
  final String name;

  @override
  List<Object?> get props => [code, name];
}
