import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class Prefix extends IDropDownItem {
  final int id;
  final int personTypeID;

  Prefix({required super.name, required this.id, required this.personTypeID});
}
