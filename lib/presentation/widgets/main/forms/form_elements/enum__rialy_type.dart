enum RialType {
  debtRemaining(0),
  creditRemaining(1),
  cannotBeDebt(2),
  cannotBeCredit(3),
  noMatter(4);

  final int value;

  const RialType(this.value);

  static RialType fromValue(int value) {
    return RialType.values[value];
  }
}