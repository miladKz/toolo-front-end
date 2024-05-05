import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_data.dart';

class ReportTarazTafziliShenavarDataDto extends ReportTarazTafziliShenavarData {
  ReportTarazTafziliShenavarDataDto(
      {required super.accountName,
      required super.accountCd,
      required super.mablaghGardeshBed,
      required super.mablaghGardeshBes,
      required super.mablaghGardeshPayanBed,
      required super.mablaghGardeshPayanBes,
      required super.mablaghMandeEbtedaBed,
      required super.mablaghMandeEbtedaBes,
      required super.mablaghMandePayanBed,
      required super.mablaghMandePayanBes,
      required super.tafziliCode,
      required super.tafziliGroupCode,
      required super.tafziliName});

  factory ReportTarazTafziliShenavarDataDto.fromMap(Map<String, dynamic> map) {
    return ReportTarazTafziliShenavarDataDto(
      accountName: map.findAsString("AccountName"),
      accountCd: map.findAsString("Accountcd"),
      mablaghGardeshBed: map.findAsDouble("MablaghGardeshBed"),
      mablaghGardeshBes: map.findAsDouble("MablaghGardeshBes"),
      mablaghGardeshPayanBed: map.findAsDouble("MablaghGardeshPayanBed"),
      mablaghGardeshPayanBes: map.findAsDouble("MablaghGardeshPayanBes"),
      mablaghMandeEbtedaBed: map.findAsDouble("MablaghMandeEbtedaBed"),
      mablaghMandeEbtedaBes: map.findAsDouble("MablaghMandeEbtedaBes"),
      mablaghMandePayanBed: map.findAsDouble("MablaghMandePayanBed"),
      mablaghMandePayanBes: map.findAsDouble("MablaghMandePayanBes"),
      tafziliCode: map.findAsString("TafziliCode"),
      tafziliGroupCode: map.findAsInt("TafziliGroupCode"),
      tafziliName: map.findAsString("TafziliName"),
    );
  }
}
