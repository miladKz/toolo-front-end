import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class ReportTarazMoghayeseyiData extends ITableRowData {
  final String accountName;
  final String accountCd;
  final int darsadRoshd;
  final double mablaghGardeshBed;
  final double mablaghGardeshBedOld;
  final double mablaghGardeshBes;
  final double mablaghGardeshBesOld;
  final double mablaghMandeGardeshBed;
  final double mablaghMandeGardeshBedOld;
  final double mablaghMandeGardeshBes;
  final double mablaghMandeGardeshBesOld;

  ReportTarazMoghayeseyiData({
    required this.accountName,
      required this.accountCd,
      required this.darsadRoshd,
      required this.mablaghGardeshBed,
      required this.mablaghGardeshBedOld,
      required this.mablaghGardeshBes,
      required this.mablaghGardeshBesOld,
      required this.mablaghMandeGardeshBed,
      required this.mablaghMandeGardeshBedOld,
      required this.mablaghMandeGardeshBes,
      required this.mablaghMandeGardeshBesOld})
      : super(id: -1, name: accountName);

  ReportTarazMoghayeseyiData getFieldsValue(List<String> keys) {
    final Map<String, dynamic> fieldMap = {
      "AccountName": accountName,
      "Accountcd": accountCd,
      "DarsadRoshd": darsadRoshd,
      "MablaghGardeshBed": mablaghGardeshBed,
      "MablaghGardeshBedOld": mablaghGardeshBedOld,
      "MablaghGardeshBes": mablaghGardeshBes,
      "MablaghGardeshBesOld": mablaghGardeshBesOld,
      "MablaghMandeGardeshBed": mablaghMandeGardeshBed,
      "MablaghMandeGardeshBedOld": mablaghMandeGardeshBedOld,
      "MablaghMandeGardeshBes": mablaghMandeGardeshBes,
      "MablaghMandeGardeshBesOld": mablaghMandeGardeshBesOld,
    };
    props.clear();
    for (String key in keys) {
      if (fieldMap.containsKey(key)) {
        props.add('${fieldMap.findAsDynamic(key)}');
      } else {
        throw ArgumentError('Invalid key: $key');
      }
    }
    return this;
  }
  List<Object> props = List.empty(growable: true);
}
