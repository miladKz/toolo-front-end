import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class DocumentType extends IDropDownItem {
  final int id;
  final int code;
  final String description;
  final int showInKardex;

  DocumentType({required super.name, required this.id, required this.code, required this.description, required this.showInKardex});


}
