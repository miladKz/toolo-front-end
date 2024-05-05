import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_column_title_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_taraz_moghayeseyi_data_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_moghayeseyi.dart';

class ReportTarazMoghayeseyiDto extends ReportTarazMoghayeseyi {
  ReportTarazMoghayeseyiDto({
    required super.dataList,
    required super.reportColumnTitle,
  });

  factory ReportTarazMoghayeseyiDto.fromMap(Map<String, dynamic> map) {
    final dataListMap = map.findAsDynamic("Data");
    final titlesMap = map.findAsDynamic("Titles");

    List<ReportTarazMoghayeseyiDataDto> dataList =
        List<ReportTarazMoghayeseyiDataDto>.from(dataListMap.map((data) {
      return ReportTarazMoghayeseyiDataDto.fromMap(data);
    })).toList();

    List<ReportColumnTitleDto> titleList =
        List<ReportColumnTitleDto>.from(titlesMap.map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return ReportTarazMoghayeseyiDto(
        dataList: dataList, reportColumnTitle: titleList);
  }
}
