import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_group_data.dart';

class ReportTarazTafziliGroupDataDto extends ReportTarazTafziliGroupData {
  ReportTarazTafziliGroupDataDto({
    required super.code,
    required super.name,
    required super.mablaghGardeshBed,
    required super.mablaghGardeshBes,
    required super.mablaghGardeshPayanBed,
    required super.mablaghGardeshPayanBes,
    required super.mablaghMandeEbtedaBed,
    required super.mablaghMandeEbtedaBes,
    required super.mablaghMandePayanBed,
    required super.mablaghMandePayanBes,
  });

  factory ReportTarazTafziliGroupDataDto.fromMap(Map<String, dynamic> map) {
    return ReportTarazTafziliGroupDataDto(
      code: map.findAsString("Code"),
      name: map.findAsString("Name"),
      mablaghGardeshBed: map.findAsDouble("MablaghGardeshBed"),
      mablaghGardeshBes: map.findAsDouble("MablaghGardeshBes"),
      mablaghGardeshPayanBed: map.findAsDouble("MablaghGardeshPayanBed"),
      mablaghGardeshPayanBes: map.findAsDouble("MablaghGardeshPayanBes"),
      mablaghMandeEbtedaBed: map.findAsDouble("MablaghMandeEbtedaBed"),
      mablaghMandeEbtedaBes: map.findAsDouble("MablaghMandeEbtedaBes"),
      mablaghMandePayanBed: map.findAsDouble("MablaghMandePayanBed"),
      mablaghMandePayanBes: map.findAsDouble("MablaghMandePayanBes"),
    );
  }
}
