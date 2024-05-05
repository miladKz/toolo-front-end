import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_moghayeseyi_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';


class ReportTarazMoghayeseyi {
  List<ReportTarazMoghayeseyiData> dataList;
  List<ReportColumnTitle> reportColumnTitle;

  ReportTarazMoghayeseyi({
    required this.dataList,
    required this.reportColumnTitle,
  });
}
