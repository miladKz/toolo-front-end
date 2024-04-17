import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

import '../../../presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class DetailGroup extends IDropDownItem  implements IDataTreeModel{
  final int id;
  String code;
  int type;

  DetailGroup({
    required super.name,
    required this.id,
    required this.code,
    required this.type,
    required this.children,
  }): displayName = name, hasChildren = children.isNotEmpty;

  @override
  List<IDataTreeModel> children;

  @override
  String displayName;

  @override
  bool hasChildren;
}
