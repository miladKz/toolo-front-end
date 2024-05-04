import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz_data.dart';

class ReportJameTarazDataDto extends ReportJameTarazData {
  ReportJameTarazDataDto({
    required super.accountName,
    required super.accountCd,
    required super.openingBalanceDebit,
    required super.openingBalanceCredit,
    required super.closingBalanceCredit,
    required super.closingBalanceDebit,
    required super.closingTurnoverCredit,
    required super.closingTurnoverDebit,
    required super.openingTurnoverCredit,
    required super.openingTurnoverDebit,
    required super.periodBalanceCredit,
    required super.periodBalanceDebit,
    required super.periodTurnoverCredit,
    required super.periodTurnoverDebit,
    required super.startingBalanceCredit,
    required super.startingBalanceDebit,
  });

  Map<String, dynamic> toMap() {
    return {};
  }

  /*,*/
  factory ReportJameTarazDataDto.fromMap(Map<String, dynamic> map) {
    return ReportJameTarazDataDto(
        accountName: map.findAsString("AccountName"),
        accountCd: map.findAsString("Accountcd"),
        openingBalanceDebit: map.findAsDouble("GardeshAvalDoreBed"),
        openingBalanceCredit: map.findAsDouble("GardeshAvalDoreBes"),
        closingBalanceCredit: map.findAsDouble("GardeshPayanDoreBed"),
        closingBalanceDebit: map.findAsDouble("GardeshPayanDoreBes"),
        closingTurnoverCredit: map.findAsDouble("GardeshTeyDoreBed"),
        closingTurnoverDebit: map.findAsDouble("GardeshTeyDoreBes"),
        openingTurnoverCredit: map.findAsDouble("MandeAvalDoreBed"),
        openingTurnoverDebit: map.findAsDouble("MandeAvalDoreBes"),
        periodBalanceCredit: map.findAsDouble("MandeEftetahieBed"),
        periodBalanceDebit: map.findAsDouble("MandeEftetahieBes"),
        periodTurnoverCredit: map.findAsDouble("MandePayanDoreBed"),
        periodTurnoverDebit: map.findAsDouble("MandePayanDoreBes"),
        startingBalanceCredit: map.findAsDouble("MandeTeyDoreBed"),
        startingBalanceDebit: map.findAsDouble("MandeTeyDoreBes"));
  }
}
