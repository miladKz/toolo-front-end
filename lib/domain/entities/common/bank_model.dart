import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class BankModel extends ITableRowData {
  BankModel({
    required super.id,
    required super.name,
    required this.code,
  });

  final int code;

  @override
  List<Object?> get props => [code, name];
}
