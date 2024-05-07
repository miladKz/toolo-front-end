import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class ReportJameTarazData extends ITableRowData {
  final String accountName;
  final String accountCd;
  final double openingTurnoverDebit;
  final double openingTurnoverCredit;
  final double closingTurnoverDebit;
  final double closingTurnoverCredit;
  final double periodTurnoverDebit;
  final double periodTurnoverCredit;
  final double openingBalanceDebit;
  final double openingBalanceCredit;
  final double startingBalanceDebit;
  final double startingBalanceCredit;
  final double closingBalanceDebit;
  final double closingBalanceCredit;
  final double periodBalanceDebit;
  final double periodBalanceCredit;

  ReportJameTarazData({
    required this.accountName,
    required this.accountCd,
    required this.openingTurnoverDebit,
    required this.openingTurnoverCredit,
    required this.closingTurnoverDebit,
    required this.closingTurnoverCredit,
    required this.periodTurnoverDebit,
    required this.periodTurnoverCredit,
    required this.openingBalanceDebit,
    required this.openingBalanceCredit,
    required this.startingBalanceDebit,
    required this.startingBalanceCredit,
    required this.closingBalanceDebit,
    required this.closingBalanceCredit,
    required this.periodBalanceDebit,
    required this.periodBalanceCredit,
  }) : super(id: -1, name: accountName);

  factory ReportJameTarazData.empty() {
    return ReportJameTarazData(
      accountName: '',
      accountCd: '',
      openingTurnoverDebit: 0,
      openingTurnoverCredit: 0,
      closingTurnoverDebit: 0,
      closingTurnoverCredit: 0,
      periodTurnoverDebit: 0,
      periodTurnoverCredit: 0,
      openingBalanceDebit: 0,
      openingBalanceCredit: 0,
      startingBalanceDebit: 0,
      startingBalanceCredit: 0,
      closingBalanceDebit: 0,
      closingBalanceCredit: 0,
      periodBalanceDebit: 0,
      periodBalanceCredit: 0,
    );
  }

  ReportJameTarazData getFieldsValue(List<String> keys) {
    final Map<String, dynamic> fieldMap = {
      'AccountName': accountName,
      'Accountcd': accountCd,
      'GardeshAvalDoreBed': openingTurnoverDebit,
      'GardeshAvalDoreBes': openingTurnoverCredit,
      'GardeshPayanDoreBed': closingTurnoverDebit,
      'GardeshPayanDoreBes': closingTurnoverCredit,
      'GardeshTeyDoreBed': periodTurnoverDebit,
      'GardeshTeyDoreBes': periodTurnoverCredit,
      'MandeAvalDoreBed': openingBalanceDebit,
      'MandeAvalDoreBes': openingBalanceCredit,
      'MandeEftetahieBed': startingBalanceDebit,
      'MandeEftetahieBes': startingBalanceCredit,
      'MandePayanDoreBed': closingBalanceDebit,
      'MandePayanDoreBes': closingBalanceCredit,
      "MandeTeyDoreBed": periodBalanceDebit,
      "MandeTeyDoreBes": periodBalanceCredit
    };
    props.clear();
    for (String key in keys) {
      if (fieldMap.containsKey(key)) {
        props.add('${fieldMap.findAsDynamic(key)}');
      } else {
        throw ArgumentError('Invalid key: $key');
      }
    }
    return this;
  }

  List<Object> props = List.empty(growable: true);
}
