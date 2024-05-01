import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';

import 'balance_and_ledgers.dart';

class BalanceAndLedgersReport {
  List<BalanceAndLedgers> balanceAndLedgers;
  List<ReportColumnTitle> reportColumnTitle;

  BalanceAndLedgersReport({
    required this.balanceAndLedgers,
    required this.reportColumnTitle,
  });
}
