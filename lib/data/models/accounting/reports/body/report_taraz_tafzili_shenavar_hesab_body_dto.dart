import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shebavar_hesab_body.dart';

class ReportTarazTafziliShenavarHesabBodyDto extends ReportTarazTafziliShenavarHesabBody {
  ReportTarazTafziliShenavarHesabBodyDto(
      {required super.activeYear,
      required super.fromDate,
      required super.toDate,
      required super.fromAccountcd,
      required super.fromNumber,
      required super.toNumber,
      required super.fromNumber2,
      required super.toNumber2,
      required super.categoryId,
      required super.displayColumn,
      required super.withEftetahie,
      required super.withEkhtetamieh,
      required super.withTasir,
      required super.withBastanHesabhayeMovaqat,
      required super.withFaqatGardeshDarha,
      required super.withFaqatMandeDarha,
      required super.withFaqatMandeDarhayeBed,
      required super.withFaqatMandeDarhayeBes,
      required super.tafziliGroupCode});

  Map<String, dynamic> toMap() {
    return {
      /*"ActiveYear": activeYear,*/
      "FromDate": fromDate,
      "ToDate": toDate,
      "FromNumber": fromNumber,
      "ToNumber": toNumber,
      "FromAccountcd": fromAccountcd,
      "FromNumber2": fromNumber2,
      "ToNumber2": toNumber2,
      "CategoryID": categoryId,
      "TafziliGroupCode": tafziliGroupCode,
      "DisplayColumn": displayColumn,
      "WithEftetahie": withEftetahie,
      "WithEkhtetamieh": withEkhtetamieh,
      "WithTasir": withTasir,
      "WithBastanHesabhayeMovaqat": withBastanHesabhayeMovaqat,
      "WithFaqatGardeshDarha": withFaqatGardeshDarha,
      "WithFaqatMandeDarha": withFaqatMandeDarha,
      "WithFaqatMandeDarhayeBed": withFaqatMandeDarhayeBed,
      "WithFaqatMandeDarhayeBes": withFaqatMandeDarhayeBes
    };
  }
}
