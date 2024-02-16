import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/fiscal_year/fiscal_year_data.dart';
import 'package:toolo_gostar/data/models/fiscal_year/work_group_data.dart';

class FiscalYearResponse {
  late final List<FiscalYearData> fiscalYearsData;
  late final List<WorkGroupData> workGroupsData;

  FiscalYearResponse.fromJson({required Map<String, dynamic> json}) {
    try {
      final fyIterable = json.findAsDynamic('fiscal_years');
      final wgIterable = json.findAsDynamic('work_groups');
      fiscalYearsData = List<FiscalYearData>.from(fyIterable.map((data) {
        return FiscalYearData.fromJson(json: data);
      }));
      workGroupsData = List<WorkGroupData>.from(wgIterable.map((data) {
        return WorkGroupData.fromJson(json: data);
      }));
    } catch (e) {
      e.toString();
    }
  }
}
