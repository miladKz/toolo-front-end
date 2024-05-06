class ReportTarazMoghayeseyiBody {
  final int activeYear;
  final String fromDate;
  final String toDate;
  final String accountcd;
  final int categoryId;
  final int accountLevel;
  final int byOldYear;
  final bool withEftetahie;
  final bool withEkhtetamieh;
  final bool withTasir;
  final bool withBastanHesabhayeMovaqat;
  final bool withEntezamiAccounts;
  final bool withFaqatGardeshDarha;
  final bool withFaqatMandeDarha;
  final bool withFaqatMandeDarhayeBed;
  final bool withFaqatMandeDarhayeBes;

  ReportTarazMoghayeseyiBody(
      {required this.activeYear,
      required this.fromDate,
      required this.toDate,
      required this.accountcd,
      required this.categoryId,
      required this.accountLevel,
      required this.byOldYear,
      required this.withEftetahie,
      required this.withEkhtetamieh,
      required this.withTasir,
      required this.withBastanHesabhayeMovaqat,
      required this.withEntezamiAccounts,
      required this.withFaqatGardeshDarha,
      required this.withFaqatMandeDarha,
      required this.withFaqatMandeDarhayeBed,
      required this.withFaqatMandeDarhayeBes});
}
