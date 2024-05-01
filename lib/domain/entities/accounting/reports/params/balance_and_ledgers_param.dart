class BalanceAndLedgersParam {
  final int activeYear;
  final DateTime fromDate;
  final DateTime toDate;
  final String accountCd;
  final int fromNumber;
  final int toNumber;
  final int fromNumber2;
  final int toNumber2;
  final int pageTypeId;
  final int saveTypeId;
  final bool withOpening;
  final bool withClosing;
  final bool withEffect;
  final bool withProfitAndLoss;
  final int accountLevel;
  final bool withSubLevels;

  const BalanceAndLedgersParam({
    required this.activeYear,
    required this.fromDate,
    required this.toDate,
    required this.accountCd,
    required this.fromNumber,
    required this.toNumber,
    required this.fromNumber2,
    required this.toNumber2,
    required this.pageTypeId,
    required this.saveTypeId,
    required this.withOpening,
    required this.withClosing,
    required this.withEffect,
    required this.withProfitAndLoss,
    required this.accountLevel,
    required this.withSubLevels,
  });
}
