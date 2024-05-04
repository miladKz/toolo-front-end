import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../../domain/entities/accounting/reports/balance_and_ledgers.dart';

class BalanceAndLedgersDto extends BalanceAndLedgers {
  BalanceAndLedgersDto({
    required super.accountName,
    required super.accountCd,
    required super.openingBalanceDebit,
    required super.openingBalanceCredit,
    required super.turnoverDebit,
    required super.turnoverCredit,
    required super.closingBalanceDebit,
    required super.closingBalanceCredit,
    required super.turnoverAndOpeningBalanceDebit,
    required super.turnoverAndOpeningBalanceCredit,
    required super.endingPeriodBalanceDebit,
    required super.endingPeriodBalanceCredit,
    required super.endingOpeningBalanceDebit,
    required super.endingOpeningBalanceCredit,
    required super.endingBalanceCredit,
    required super.endingBalanceDebit,
  });

  Map<String, dynamic> toMap() {
    return {};
  }

  factory BalanceAndLedgersDto.fromMap(Map<String, dynamic> map) {
    return BalanceAndLedgersDto(
      accountName: map.findAsString("AccountName"),
      accountCd: map.findAsString("Accountcd"),
      openingBalanceDebit: map.findAsDouble("MablaghEbtedaBed"),
      openingBalanceCredit: map.findAsDouble("MablaghEbtedaBes"),
      turnoverDebit: map.findAsDouble("MablaghGardeshBed"),
      turnoverCredit: map.findAsDouble("MablaghGardeshBes"),
      closingBalanceDebit: map.findAsDouble("MablaghGardeshPayanBed"),
      closingBalanceCredit: map.findAsDouble("MablaghGardeshPayanBes"),
      turnoverAndOpeningBalanceDebit:
          map.findAsDouble("MablaghGardeshVaEbtedaBed"),
      turnoverAndOpeningBalanceCredit:
          map.findAsDouble("MablaghGardeshVaEbtedaBes"),
      endingPeriodBalanceDebit: map.findAsDouble("MablaghMandeDoreBed"),
      endingPeriodBalanceCredit: map.findAsDouble("MablaghMandeDoreBes"),
      endingOpeningBalanceDebit: map.findAsDouble("MablaghMandeEbtedaBed"),
      endingOpeningBalanceCredit: map.findAsDouble("MablaghMandeEbtedaBes"),
      endingBalanceDebit: map.findAsDouble("MablaghMandePayanBed"),
      endingBalanceCredit: map.findAsDouble("MablaghMandePayanBes"),
    );
  }
}