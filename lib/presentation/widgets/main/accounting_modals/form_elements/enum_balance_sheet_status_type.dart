enum BalanceSheetStatusType {
  debt(0),
  asset(1),
  proprietaryRights(2);

  final int value;

  const BalanceSheetStatusType(this.value);

  static BalanceSheetStatusType fromValue(int value) {
    return BalanceSheetStatusType.values[value];
  }
}