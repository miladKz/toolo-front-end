enum CounterPartyKinds {
  people(1),
  bank(2),
  cardReader(3),
  revolvingFund(4),
  cashBox(5);

  final int value;

  const CounterPartyKinds(this.value);

  static CounterPartyKinds fromValue(int value) {
    return CounterPartyKinds.values[value - 1];
  }
}
