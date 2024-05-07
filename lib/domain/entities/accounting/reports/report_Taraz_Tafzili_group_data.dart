import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class ReportTarazTafziliGroupData extends ITableRowData {
  final String code;
  final double mablaghGardeshBed;
  final double mablaghGardeshBes;
  final double mablaghGardeshPayanBed;
  final double mablaghGardeshPayanBes;
  final double mablaghMandeEbtedaBed;
  final double mablaghMandeEbtedaBes;
  final double mablaghMandePayanBed;
  final double mablaghMandePayanBes;

  ReportTarazTafziliGroupData({
    required this.code,
    required super.name,
    required this.mablaghGardeshBed,
    required this.mablaghGardeshBes,
    required this.mablaghGardeshPayanBed,
    required this.mablaghGardeshPayanBes,
    required this.mablaghMandeEbtedaBed,
    required this.mablaghMandeEbtedaBes,
    required this.mablaghMandePayanBed,
    required this.mablaghMandePayanBes,
  }) : super(
          id: -1,
        );

  ReportTarazTafziliGroupData getFieldsValue(List<String> keys) {
    final Map<String, dynamic> fieldMap = {
      "Code": code,
      "MablaghGardeshBed": mablaghGardeshBed,
      "MablaghGardeshBes": mablaghGardeshBes,
      "MablaghGardeshPayanBed": mablaghGardeshPayanBed,
      "MablaghGardeshPayanBes": mablaghGardeshPayanBes,
      "MablaghMandeEbtedaBed": mablaghMandeEbtedaBed,
      "MablaghMandeEbtedaBes": mablaghMandeEbtedaBes,
      "MablaghMandePayanBed": mablaghMandePayanBed,
      "MablaghMandePayanBes": mablaghMandePayanBes,
      "Name": name
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
