import 'abstracts/table_row_data_abs.dart';

class RevolvingFundMain extends ITableRowData {
  RevolvingFundMain(
      {required super.id,
      required this.code,
      required super.name,
      required this.currencyType,
      required this.description,
      required this.revolvingFundType,
      required this.ceilingFund});

  int code;
  String currencyType;
  String description;
  String revolvingFundType;
  int ceilingFund;

  @override
  List<Object?> get props =>
      [code, name, currencyType, description, revolvingFundType, ceilingFund];
}
