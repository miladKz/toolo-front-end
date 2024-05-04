import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';


class ReportTarazTafziliShenavar {
  List<ReportTarazTafziliShenavarData> dataList;
  List<ReportColumnTitle> reportColumnTitle;

  ReportTarazTafziliShenavar({
    required this.dataList,
    required this.reportColumnTitle,
  });
}
