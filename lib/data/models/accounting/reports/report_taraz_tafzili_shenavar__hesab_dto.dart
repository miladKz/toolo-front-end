import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_column_title_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_taraz_tafzili_shenavar_data_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_taraz_tafzili_shenavar_hesab_data_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar_hesab.dart';

class ReportTarazTafziliShenavarHesabDto extends ReportTarazTafziliShenavarHesab {
  ReportTarazTafziliShenavarHesabDto({
    required super.dataList,
    required super.reportColumnTitle,
  });

  factory ReportTarazTafziliShenavarHesabDto.fromMap(Map<String, dynamic> map) {
    final dataListMap = map.findAsDynamic("Data");
    final titlesMap = map.findAsDynamic("Titles");

    List<ReportTarazTafziliShenavarHesabDataDto> dataList =
        List<ReportTarazTafziliShenavarHesabDataDto>.from(dataListMap.map((data) {
      return ReportTarazTafziliShenavarHesabDataDto.fromMap(data);
    })).toList();

    List<ReportColumnTitleDto> titleList =
        List<ReportColumnTitleDto>.from(titlesMap.map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return ReportTarazTafziliShenavarHesabDto(
        dataList: dataList, reportColumnTitle: titleList);
  }
}
