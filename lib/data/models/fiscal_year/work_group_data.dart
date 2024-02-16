import 'package:atras_data_parser/atras_data_parser.dart';

class WorkGroupData{
  late final int workGroupId;
  late final String workGroupName;

  WorkGroupData.fromJson({required Map<String, dynamic> json}){
    workGroupId=json.findAsInt('work_group_id');
    workGroupName=json.findAsString('work_group_name');
  }
}
