import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz_data.dart';


class ReportTarazTafziliShenavar {
  List<ReportJameTarazData> dataList;
  List<ReportColumnTitle> reportColumnTitle;

  ReportTarazTafziliShenavar({
    required this.dataList,
    required this.reportColumnTitle,
  });
}
