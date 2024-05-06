import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_moghayeseyi_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shenavar_hesab_body.dart';

class ReportTarazMoghayeseyiBodyDto extends ReportTarazMoghayeseyiBody {
  ReportTarazMoghayeseyiBodyDto(
      {required super.activeYear,
      required super.fromDate,
      required super.toDate,
      required super.accountcd,
      required super.categoryId,
      required super.accountLevel,
      required super.byOldYear,
      required super.withEftetahie,
      required super.withEkhtetamieh,
      required super.withTasir,
      required super.withBastanHesabhayeMovaqat,
      required super.withFaqatGardeshDarha,
      required super.withFaqatMandeDarha,
      required super.withFaqatMandeDarhayeBed,
      required super.withFaqatMandeDarhayeBes,
      required super.withEntezamiAccounts});

  Map<String, dynamic> toMap() {
    return {
      /*"ActiveYear": activeYear,*/
      "FromDate": fromDate,
      "ToDate": toDate,
      "Accountcd": accountcd,
      "CategoryID": categoryId,
      "AccountLevel": accountLevel,
      "ByOldYear": byOldYear,
      "WithEntezamiAccounts": withEntezamiAccounts,
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
