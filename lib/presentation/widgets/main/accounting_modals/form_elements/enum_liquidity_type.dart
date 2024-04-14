enum LiquidityType {
  balanceSheet(0),
  profitAndLoss(1),
  disciplinary(2);

  final int value;

  const LiquidityType(this.value);

  static LiquidityType fromValue(int value) {
    return LiquidityType.values[value];
  }
}