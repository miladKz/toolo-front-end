enum CustomerDetailType {
  all(-1),
  additionalDetail(0),
  additionalAddress(1);

  final int value;

  const CustomerDetailType(this.value);

  static CustomerDetailType fromValue(int value) {
    return CustomerDetailType.values[value - 1];
  }
}
