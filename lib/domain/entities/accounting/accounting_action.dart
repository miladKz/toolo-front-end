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
  bool isPinned;

  AccountingAction(
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
      required this.parentCode,
       this.isPinned = false,});

  void updatePinned(bool pinned){
    isPinned = pinned;
  }

  @override
  String toString() {
    return 'AccountingAction{id: $id, actionCode: $actionCode, actionName: $actionName, code: $code, categoryIndex: $categoryIndex, description: $description, endPoint: $endPoint, hasChildren: $hasChildren, children: $children, levelIndex: $levelIndex, orderIndex: $orderIndex, parentCode: $parentCode, isPinned: $isPinned}';
  }
}


