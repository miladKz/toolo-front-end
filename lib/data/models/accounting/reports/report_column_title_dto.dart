import 'package:atras_data_parser/atras_data_parser.dart';

import '../../../../domain/entities/accounting/reports/report_column_title.dart';

class ReportColumnTitleDto extends ReportColumnTitle {
  ReportColumnTitleDto({
    required super.order,
    required super.name,
    required super.title,
    required super.children,
  });

  factory ReportColumnTitleDto.fromMap(Map<String, dynamic> map) {
    List<ReportColumnTitleDto> children =
    List<ReportColumnTitleDto>.from(map.findAsDynamic("Childs").map((data) {
      return ReportColumnTitleDto.fromMap(data);
    })).toList();
    return ReportColumnTitleDto(
        order: map.findAsInt("Order"),
        name: map.findAsString("Name").clearNull(),
        title: map.findAsString("Title"),
        children: children);
  }
}
