class AccountingAction {
  final int id;
  final String actionCode;
  final String actionName;
  final String code;
  final int categoryIndex;
  final String description;
  final String endPoint;
  final bool hasChildren;
  final List<AccountingAction> children;
  final int levelIndex;
  final int orderIndex;
  final String parentCode;

 const AccountingAction(
      {required this.id,
      required this.actionCode,
      required this.actionName,
      required this.code,
      required this.categoryIndex,
      required this.description,
      required this.hasChildren,
      required this.children,
      required this.levelIndex,
      required this.orderIndex,
      required this.endPoint,
      required this.parentCode,});
}
