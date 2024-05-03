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
    final dataListMap = map.findAsDynamic("Data");
    final titlesMap = map.findAsDynamic("Titles");

    List<BalanceAndLedgersDto> dataList =
        List<BalanceAndLedgersDto>.from(dataListMap.map((data) {
      return BalanceAndLedgersDto.fromMap(data);
    })).toList();

    List<ReportColumnTitleDto> titleList =
        List<ReportColumnTitleDto>.from(titlesMap.map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return BalanceAndLedgersReportDto(
        balanceAndLedgers: dataList, reportColumnTitle: titleList);
  }
}
