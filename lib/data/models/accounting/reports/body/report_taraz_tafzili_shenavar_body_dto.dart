import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shenavar_body.dart';

class ReportTarazTafziliShenavarBodyDto extends ReportTarazTafziliShenavarBody {
  ReportTarazTafziliShenavarBodyDto(
      {required super.activeYear,
      required super.fromDate,
      required super.toDate,
      required super.accountCd,
      required super.fromNumber,
      required super.toNumber,
      required super.fromNumber2,
      required super.toNumber2,
      required super.categoryId,
      required super.tafziliGroupCode,
      required super.displayColumn,
      required super.withEftetahie,
      required super.withEkhtetamieh,
      required super.withTasir,
      required super.withSoodZian,
      required super.withBastanHesabhayeMovaqat,
      required super.withEntezamiAccounts,
      required super.withFaqatGardeshDarha,
      required super.withFaqatMandeDarha,
      required super.withFaqatMandeDarhayeBed,
      required super.withFaqatMandeDarhayeBes});



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
      "TafziliGroupCode": tafziliGroupCode,
      "DisplayColumn": displayColumn,
      "WithEftetahie": withEftetahie,
      "WithEkhtetamieh": withEkhtetamieh,
      "WithTasir": withTasir,
      "WithSoodZian": withSoodZian,
      "WithBastanHesabhayeMovaqat": withBastanHesabhayeMovaqat,
      "WithEntezamiAccounts": withEntezamiAccounts,
      "WithFaqatGardeshDarha": withFaqatGardeshDarha,
      "WithFaqatMandeDarha": withFaqatMandeDarha,
      "WithFaqatMandeDarhayeBed": withFaqatMandeDarhayeBed,
      "WithFaqatMandeDarhayeBes": withFaqatMandeDarhayeBes,
    };
  }
}
