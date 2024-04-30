import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class CategoryModel extends IDropDownItem {
  final int id;
  final int code;
  final bool withAvarez;

  CategoryModel({required super.name, required this.id, required this.code, required this.withAvarez});


}
