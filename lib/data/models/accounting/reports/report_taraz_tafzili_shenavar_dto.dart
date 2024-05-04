import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_column_title_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_jame_taraz_data_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_taraz_tafzili_shenavar_data_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar.dart';

class ReportTarazTafziliShenavarDto extends ReportTarazTafziliShenavar {
  ReportTarazTafziliShenavarDto({
    required super.dataList,
    required super.reportColumnTitle,
  });

  factory ReportTarazTafziliShenavarDto.fromMap(Map<String, dynamic> map) {
    final dataListMap = map.findAsDynamic("Data");
    final titlesMap = map.findAsDynamic("Titles");

    List<ReportTarazTafziliShenavarDataDto> dataList =
        List<ReportTarazTafziliShenavarDataDto>.from(dataListMap.map((data) {
      return ReportTarazTafziliShenavarDataDto.fromMap(data);
    })).toList();

    List<ReportColumnTitleDto> titleList =
        List<ReportColumnTitleDto>.from(titlesMap.map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return ReportTarazTafziliShenavarDto(
        dataList: dataList, reportColumnTitle: titleList);
  }
}
