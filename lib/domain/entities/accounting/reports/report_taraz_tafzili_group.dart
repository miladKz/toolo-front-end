import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_group_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';


class ReportTarazTafziliGroup {
  List<ReportTarazTafziliGroupData> dataList;
  List<ReportColumnTitle> reportColumnTitle;

  ReportTarazTafziliGroup({
    required this.dataList,
    required this.reportColumnTitle,
  });
}
