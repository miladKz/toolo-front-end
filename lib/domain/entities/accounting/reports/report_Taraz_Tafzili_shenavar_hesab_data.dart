import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class ReportTarazTafziliShenavarHesabData extends ITableRowData {
  final String accountName;
  final String accountCd;
  final double mablaghGardeshBed;
  final double mablaghGardeshBes;
  final double mablaghGardeshPayanBed;
  final double mablaghGardeshPayanBes;
  final double mablaghMandeEbtedaBed;
  final double mablaghMandeEbtedaBes;
  final double mablaghMandePayanBed;
  final double mablaghMandePayanBes;
  final String tafziliCode;
  final int tafziliGroupCode;
  final int tafziliID;
  final String tafziliName;

  ReportTarazTafziliShenavarHesabData(
      {required this.accountName,
      required this.accountCd,
      required this.mablaghGardeshBed,
      required this.mablaghGardeshBes,
      required this.mablaghGardeshPayanBed,
      required this.mablaghGardeshPayanBes,
      required this.mablaghMandeEbtedaBed,
      required this.mablaghMandeEbtedaBes,
      required this.mablaghMandePayanBed,
      required this.mablaghMandePayanBes,
      required this.tafziliCode,
      required this.tafziliGroupCode,
      required this.tafziliID,
      required this.tafziliName})
      : super(id: tafziliID, name: tafziliName);

  ReportTarazTafziliShenavarHesabData getFieldsValue(List<String> keys) {
    final Map<String, dynamic> fieldMap = {
      "AccountName": accountName,
      "Accountcd": accountCd,
      "MablaghGardeshBed": mablaghGardeshBed,
      "MablaghGardeshBes": mablaghGardeshBes,
      "MablaghGardeshPayanBed": mablaghGardeshPayanBed,
      "MablaghGardeshPayanBes": mablaghGardeshPayanBes,
      "MablaghMandeEbtedaBed": mablaghMandeEbtedaBed,
      "MablaghMandeEbtedaBes": mablaghMandeEbtedaBes,
      "MablaghMandePayanBed": mablaghMandePayanBed,
      "MablaghMandePayanBes": mablaghMandePayanBes,
      "TafziliCode": tafziliCode,
      "TafziliGroupCode": tafziliGroupCode,
      "TafziliID": tafziliID,
      "TafziliName": tafziliName
    };

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