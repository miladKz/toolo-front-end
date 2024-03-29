abstract class IDataTreeModel {
  String displayName;
  final int id;
  bool hasChildren;
  List<IDataTreeModel> children;

  IDataTreeModel(
      {required this.displayName,
      required this.id,
      required this.hasChildren,
      required this.children});
}
