enum StandardDetailType {
  companyType(1),
  revolvingFundType(2),
  counterpartyAdditionalDetail(3),
  counterpartyAdditionalAddress(4);

  final int value;

  const StandardDetailType(this.value);

  static StandardDetailType fromValue(int value) {
    return StandardDetailType.values[value - 1];
  }
}
