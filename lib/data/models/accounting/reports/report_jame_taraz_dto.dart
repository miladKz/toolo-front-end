import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_column_title_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_jame_taraz_data_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz.dart';

class ReportJameTarazDto extends ReportJameTaraz {
  ReportJameTarazDto({
    required super.dataList,
    required super.reportColumnTitle,
  });

  factory ReportJameTarazDto.fromMap(Map<String, dynamic> map) {
    final dataListMap = map.findAsDynamic("Data");
    final titlesMap = map.findAsDynamic("Titles");

    List<ReportJameTarazDataDto> dataList =
        List<ReportJameTarazDataDto>.from(dataListMap.map((data) {
      return ReportJameTarazDataDto.fromMap(data);
    })).toList();

    List<ReportColumnTitleDto> titleList =
        List<ReportColumnTitleDto>.from(titlesMap.map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return ReportJameTarazDto(
        dataList: dataList, reportColumnTitle: titleList);
  }
}
