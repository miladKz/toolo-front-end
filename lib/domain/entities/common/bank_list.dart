import 'abstracts/table_row_data_abs.dart';

class BankList extends ITableRowData {
  BankList({
    required super.id,
    required this.bankName,
    required this.branchCode,
    required this.branchName,
    required this.currencyType,
  });

  String bankName;
  int branchCode;
  String branchName;
  String currencyType;

  @override
  List<Object?> get props => [bankName,branchCode,branchName,currencyType];
}