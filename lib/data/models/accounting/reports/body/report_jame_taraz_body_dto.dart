import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_jame_taraz_body.dart';

class ReportJameTarazBodyDto extends ReportJameTarazBody {
  ReportJameTarazBodyDto(
      {required super.activeYear,
      required super.fromDate,
      required super.toDate,
      required super.accountCd,
      required super.fromNumber,
      required super.toNumber,
      required super.fromNumber2,
      required super.toNumber2,
      required super.categoryId,
      required super.accountLevel,
      required super.withEftetahie,
      required super.withEkhtetamieh,
      required super.withTasir,
      required super.withSoodZian,
      required super.withBastanHesabhayeMovaqat,
      required super.withEntezamiAccounts,
      required super.withFaqatGardeshDarha,
      required super.withFaqatMandeDarha,
      required super.withFaqatMandeDarhayeBed,
      required super.withFaqatMandeDarhayeBes,
      required super.showMandeEftetahie,
      required super.showGardeshAvalDore,
      required super.showMandeAvalDore,
      required super.showGardeshTeyDore,
      required super.showMandeTeyDore,
      required super.showGardeshPayanDore,
      required super.showMandePayanDore});

  Map<String, dynamic> toMap() {
    return {
      /*"ActiveYear": activeYear,*/
      "FromDate": fromDate,
      "ToDate": toDate,
      "Accountcd": accountCd,
      "FromNumber": fromNumber,
      "ToNumber": toNumber,
      "FromNumber2": fromNumber2,
      "ToNumber2": toNumber2,
      "CategoryID": categoryId,
      "WithEftetahie": withEftetahie,
      "WithEkhtetamieh": withEkhtetamieh,
      "WithTasir": withTasir,
      "WithSoodZian": withSoodZian,
      "AccountLevel": accountLevel,
      "WithBastanHesabhayeMovaqat": withBastanHesabhayeMovaqat,
      "WithEntezamiAccounts": withEntezamiAccounts,
      "WithFaqatGardeshDarha": withFaqatGardeshDarha,
      "WithFaqatMandeDarha": withFaqatMandeDarha,
      "WithFaqatMandeDarhayeBed": withFaqatMandeDarhayeBed,
      "WithFaqatMandeDarhayeBes": withFaqatMandeDarhayeBes,
      "ShowMandeEftetahie": showMandeEftetahie,
      "ShowGardeshAvalDore": showGardeshAvalDore,
      "ShowMandeAvalDore": showMandeAvalDore,
      "ShowGardeshTeyDore": showGardeshTeyDore,
      "ShowMandeTeyDore": showMandeTeyDore,
      "ShowGardeshPayanDore": showGardeshPayanDore,
      "ShowMandePayanDore": showMandePayanDore
    };
  }
}
