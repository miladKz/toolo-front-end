class ReportTarazTafziliShenavarBody {
  final int activeYear;
  final String fromDate;
  final String toDate;
  final String accountCd;
  final int fromNumber;
  final int toNumber;
  final int fromNumber2;
  final int toNumber2;
  final int categoryId;
  final int tafziliGroupCode;
  final int displayColumn;

  final bool withEftetahie;
  final bool withEkhtetamieh;
  final bool withTasir;
  final bool withBastanHesabhayeMovaqat;
  final bool withFaqatGardeshDarha;
  final bool withFaqatMandeDarha;
  final bool withFaqatMandeDarhayeBed;
  final bool withFaqatMandeDarhayeBes;
  final bool isMoshtari;
  final bool isKarkonan;
  final bool isSarmayePazir;
  final bool isTashilatGirande;
  final bool isTamin;
  final bool isVasete;
  final bool isShoraka;
  final bool isTashilatDahande;
  final bool isSayer;

  ReportTarazTafziliShenavarBody({
    required this.activeYear,
    required this.fromDate,
    required this.toDate,
    required this.accountCd,
    required this.fromNumber,
    required this.toNumber,
    required this.fromNumber2,
    required this.toNumber2,
    required this.categoryId,
    required this.tafziliGroupCode,
    required this.displayColumn,
    required this.withEftetahie,
    required this.withEkhtetamieh,
    required this.withTasir,
    required this.withBastanHesabhayeMovaqat,
    required this.withFaqatGardeshDarha,
    required this.withFaqatMandeDarha,
    required this.withFaqatMandeDarhayeBed,
    required this.withFaqatMandeDarhayeBes,
    required this.isMoshtari,
    required this.isKarkonan,
    required this.isSarmayePazir,
    required this.isTashilatGirande,
    required this.isTamin,
    required this.isVasete,
    required this.isShoraka,
    required this.isTashilatDahande,
    required this.isSayer,
  });
}
