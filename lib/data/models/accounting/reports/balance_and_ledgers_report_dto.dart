import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_column_title_dto.dart';

import '../../../../domain/entities/accounting/reports/balance_and_ledgers_report.dart';
import 'balance_and_ledgers_dto.dart';

class BalanceAndLedgersReportDto extends BalanceAndLedgersReport {
  BalanceAndLedgersReportDto({
    required super.balanceAndLedgers,
    required super.reportColumnTitle,
  });

  factory BalanceAndLedgersReportDto.fromMap(Map<String, dynamic> map) {
    return BalanceAndLedgersReportDto(
      balanceAndLedgers: map
          .findAsDynamic("DataList")
          ?.map((dynamic item) =>
              BalanceAndLedgersDto.fromMap(item as Map<String, dynamic>))
          ?.toList(),
      reportColumnTitle: map
          .findAsDynamic("Titles")
          ?.map((dynamic item) =>
              ReportColumnTitleDto.fromMap(item as Map<String, dynamic>))
          ?.toList(),
    );
  }
}
