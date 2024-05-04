class ReportJameTarazBody {
  final int activeYear;
  final String fromDate;
  final String toDate;
  final String accountCd;
  final int fromNumber;
  final int toNumber;
  final int fromNumber2;
  final int toNumber2;
  final int categoryId;
  final int accountLevel;
  final bool withEftetahie;
  final bool withEkhtetamieh;
  final bool withTasir;
  final bool withSoodZian;
  final bool withBastanHesabhayeMovaqat;
  final bool withEntezamiAccounts;
  final bool withFaqatGardeshDarha;
  final bool withFaqatMandeDarha;
  final bool withFaqatMandeDarhayeBed;
  final bool withFaqatMandeDarhayeBes;
  final bool showMandeEftetahie;
  final bool showGardeshAvalDore;
  final bool showMandeAvalDore;
  final bool showGardeshTeyDore;
  final bool showMandeTeyDore;
  final bool showGardeshPayanDore;
  final bool showMandePayanDore;

  ReportJameTarazBody(
      {required this.activeYear,
      required this.fromDate,
      required this.toDate,
      required this.accountCd,
      required this.fromNumber,
      required this.toNumber,
      required this.fromNumber2,
      required this.toNumber2,
      required this.categoryId,
      required this.accountLevel,
      required this.withEftetahie,
      required this.withEkhtetamieh,
      required this.withTasir,
      required this.withSoodZian,
      required this.withBastanHesabhayeMovaqat,
      required this.withEntezamiAccounts,
      required this.withFaqatGardeshDarha,
      required this.withFaqatMandeDarha,
      required this.withFaqatMandeDarhayeBed,
      required this.withFaqatMandeDarhayeBes,
      required this.showMandeEftetahie,
      required this.showGardeshAvalDore,
      required this.showMandeAvalDore,
      required this.showGardeshTeyDore,
      required this.showMandeTeyDore,
      required this.showGardeshPayanDore,
      required this.showMandePayanDore            });

}