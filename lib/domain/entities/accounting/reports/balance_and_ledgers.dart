class BalanceAndLedgers {
  final String accountName;
  final String accountCd;
  final double openingBalanceDebit;
  final double openingBalanceCredit;
  final double turnoverDebit;
  final double turnoverCredit;
  final double closingBalanceDebit;
  final double closingBalanceCredit;
  final double turnoverAndOpeningBalanceDebit;
  final double turnoverAndOpeningBalanceCredit;
  final double endingPeriodBalanceDebit;
  final double endingPeriodBalanceCredit;
  final double endingOpeningBalanceDebit;
  final double endingOpeningBalanceCredit;
  final double endingBalanceDebit;
  final double endingBalanceCredit;

  BalanceAndLedgers({
    required this.accountName,
    required this.accountCd,
    required this.openingBalanceDebit,
    required this.openingBalanceCredit,
    required this.turnoverDebit,
    required this.turnoverCredit,
    required this.closingBalanceDebit,
    required this.closingBalanceCredit,
    required this.turnoverAndOpeningBalanceDebit,
    required this.turnoverAndOpeningBalanceCredit,
    required this.endingPeriodBalanceDebit,
    required this.endingPeriodBalanceCredit,
    required this.endingOpeningBalanceDebit,
    required this.endingOpeningBalanceCredit,
    required this.endingBalanceDebit,
    required this.endingBalanceCredit,
  });

  factory BalanceAndLedgers.empty() {
    return BalanceAndLedgers(
      accountName: '',
      accountCd: '',
      openingBalanceDebit: 0,
      openingBalanceCredit: 0,
      turnoverDebit: 0,
      turnoverCredit: 0,
      closingBalanceDebit: 0,
      closingBalanceCredit: 0,
      turnoverAndOpeningBalanceDebit: 0,
      turnoverAndOpeningBalanceCredit: 0,
      endingPeriodBalanceDebit: 0,
      endingPeriodBalanceCredit: 0,
      endingOpeningBalanceDebit: 0,
      endingOpeningBalanceCredit: 0,
      endingBalanceCredit: 0,
      endingBalanceDebit: 0,
    );
  }

  getFieldValue(String key) {
    final Map<String, dynamic> fieldMap = {
      'AccountName': accountName,
      'Accountcd': accountCd,
      'MablaghEbtedaBed': openingBalanceDebit,
      'MablaghEbtedaBes': openingBalanceCredit,
      'MablaghGardeshBed': turnoverDebit,
      'MablaghGardeshBes': turnoverCredit,
      'MablaghGardeshPayanBed': closingBalanceDebit,
      'MablaghGardeshPayanBes': closingBalanceCredit,
      'MablaghGardeshVaEbtedaBed': turnoverAndOpeningBalanceDebit,
      'MablaghGardeshVaEbtedaBes': turnoverAndOpeningBalanceCredit,
      'MablaghMandeDoreBed': endingPeriodBalanceDebit,
      'MablaghMandeDoreBes': endingPeriodBalanceCredit,
      'MablaghMandeEbtedaBed': endingOpeningBalanceDebit,
      'MablaghMandeEbtedaBes': endingOpeningBalanceCredit,
      "MablaghMandePayanBed": endingBalanceDebit,
      "MablaghMandePayanBes": endingBalanceCredit
    };

    if (fieldMap.containsKey(key)) {
      return fieldMap[key];
    } else {
      throw ArgumentError('Invalid key: $key');
    }
  }
}
