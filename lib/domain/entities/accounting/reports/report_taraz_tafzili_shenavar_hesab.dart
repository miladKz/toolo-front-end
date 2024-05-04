import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_hesab_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_column_title.dart';


class ReportTarazTafziliShenavarHesab {
  List<ReportTarazTafziliShenavarHesabData> dataList;
  List<ReportColumnTitle> reportColumnTitle;

  ReportTarazTafziliShenavarHesab({
    required this.dataList,
    required this.reportColumnTitle,
  });
}
