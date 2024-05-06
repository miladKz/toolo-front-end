import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_moghayeseyi_data.dart';

class ReportTarazMoghayeseyiDataDto extends ReportTarazMoghayeseyiData {
  ReportTarazMoghayeseyiDataDto(
      {required super.accountName,
      required super.accountCd,
      required super.darsadRoshd,
      required super.mablaghGardeshBed,
      required super.mablaghGardeshBedOld,
      required super.mablaghGardeshBes,
      required super.mablaghGardeshBesOld,
      required super.mablaghMandeGardeshBed,
      required super.mablaghMandeGardeshBedOld,
      required super.mablaghMandeGardeshBes,
      required super.mablaghMandeGardeshBesOld});

  factory ReportTarazMoghayeseyiDataDto.fromMap(Map<String, dynamic> map) {
    return ReportTarazMoghayeseyiDataDto(
      accountName: map.findAsString("AccountName"),
      accountCd: map.findAsString("Accountcd"),
      darsadRoshd: map.findAsInt("DarsadRoshd"),
      mablaghGardeshBed: map.findAsDouble("MablaghGardeshBed"),
      mablaghGardeshBedOld: map.findAsDouble("MablaghGardeshBedOld"),
      mablaghGardeshBes: map.findAsDouble("MablaghGardeshBes"),
      mablaghGardeshBesOld: map.findAsDouble("MablaghGardeshBesOld"),
      mablaghMandeGardeshBed: map.findAsDouble("MablaghMandeGardeshBed"),
      mablaghMandeGardeshBedOld: map.findAsDouble("MablaghMandeGardeshBedOld"),
      mablaghMandeGardeshBes: map.findAsDouble("MablaghMandeGardeshBes"),
      mablaghMandeGardeshBesOld: map.findAsDouble("MablaghMandeGardeshBesOld"),
    );
  }
}
