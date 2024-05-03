class BalanceAndLedgersParam {
  final int activeYear;
  final String fromDate;
  final String toDate;
  final String accountCd;
  final int fromNumber;
  final int toNumber;
  final int fromNumber2;
  final int toNumber2;
  final int categoryId;
  final int saveTypeId;
  ///نوع تراز
  final int accountLevel;
  final int displayColumn;
  final bool withEftetahie;
  final bool withEkhtetamieh;
  final bool withTasir;
  final bool withSoodZian;
  final bool withZirSath;
  final bool withBastanHesabhayeMovaqat;
  final bool withEntezamiAccounts;
  final bool withFaqatGardeshDarha;
  final bool withFaqatMandeDarha;
  final bool withFaqatMandeDarhayeBed;
  final bool withFaqatMandeDarhayeBes;

  BalanceAndLedgersParam(
      {required this.activeYear,
      required this.fromDate,
      required this.toDate,
      required this.accountCd,
      required this.fromNumber,
      required this.toNumber,
      required this.fromNumber2,
      required this.toNumber2,
      required this.categoryId,
      required this.saveTypeId,
      required this.accountLevel,
      required this.displayColumn,
      required this.withEftetahie,
      required this.withEkhtetamieh,
      required this.withTasir,
      required this.withSoodZian,
      required this.withZirSath,
      required this.withBastanHesabhayeMovaqat,
      required this.withEntezamiAccounts,
      required this.withFaqatGardeshDarha,
      required this.withFaqatMandeDarha,
      required this.withFaqatMandeDarhayeBed,
      required this.withFaqatMandeDarhayeBes});
}
