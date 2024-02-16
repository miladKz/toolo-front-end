import 'package:atras_data_parser/atras_data_parser.dart';

class FiscalYearData {
 late final int fiscalYearId;
 late final String fiscalYearName;
 late final int workGroupId;

  FiscalYearData.fromJson({required Map<String, dynamic> json}){
    fiscalYearId=json.findAsInt('fiscal_year_id');
    fiscalYearName=json.findAsString('fiscal_year_name');
    workGroupId=json.findAsInt('work_group_id');
  }
}
