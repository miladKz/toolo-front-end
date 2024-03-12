enum BalanceSheetType {
  balanceSheet(0),
  profitAndLoss(1),
  disciplinary(2);

  final int value;

  const BalanceSheetType(this.value);

  static BalanceSheetType fromValue(int value) {
    return BalanceSheetType.values[value];
  }
}