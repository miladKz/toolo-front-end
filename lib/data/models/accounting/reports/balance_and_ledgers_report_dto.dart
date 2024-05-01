import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../../domain/entities/accounting/reports/balance_and_ledgers_report.dart';

class BalanceAndLedgersReportDto extends BalanceAndLedgersReport {
  BalanceAndLedgersReportDto(
      {required super.displayName,
      required super.id,
      required super.hasChildren,
      required super.children});

  Map<String, dynamic> toMap() {
    return {};
  }

  factory BalanceAndLedgersReportDto.fromMap(Map<String, dynamic> map) {
    return BalanceAndLedgersReportDto(
        displayName: map.findAsString("key"),
        id: map.findAsInt("key"),
        hasChildren: map.findAsBool("key"),
        children: map.findAsDynamic("key"));
  }
}
