
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class DetailGroupRoot extends IDropDownItem {
  final int id;
  final int code;
  final int type;

  DetailGroupRoot({required super.name, required this.id, required this.code, required this.type});


}
