
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class CustomerDataDetail extends IDropDownItem {
  final int id;
  final int moshtarianID;
  final int parentID;
  final String title;
  final String value;
  final int valueType;

  CustomerDataDetail({ required this.id, required this.moshtarianID, required this.parentID, required this.title, required this.value, required this.valueType}):super(name: title);



}
