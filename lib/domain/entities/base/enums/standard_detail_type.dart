enum StandardDetailType {
  revolvingFundType(2);

  final int value;

  const StandardDetailType(this.value);

  static StandardDetailType fromValue(int value) {
    return StandardDetailType.values[value - 1];
  }
}
