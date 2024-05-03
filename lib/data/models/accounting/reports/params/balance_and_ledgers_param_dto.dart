import '../../../../../domain/entities/accounting/reports/params/balance_and_ledgers_param.dart';

class BalanceAndLedgersParamDto extends BalanceAndLedgersParam {
  BalanceAndLedgersParamDto(
      {required super.activeYear,
      required super.fromDate,
      required super.toDate,
      required super.accountCd,
      required super.fromNumber,
      required super.toNumber,
      required super.fromNumber2,
      required super.toNumber2,
      required super.categoryId,
      required super.saveTypeId,
      required super.accountLevel,
      required super.displayColumn,
      required super.withEftetahie,
      required super.withEkhtetamieh,
      required super.withTasir,
      required super.withSoodZian,
      required super.withZirSath,
      required super.withBastanHesabhayeMovaqat,
      required super.withEntezamiAccounts,
      required super.withFaqatGardeshDarha,
      required super.withFaqatMandeDarha,
      required super.withFaqatMandeDarhayeBed,
      required super.withFaqatMandeDarhayeBes});

  Map<String, dynamic> toMap() {

    return {
      "ActiveYear": activeYear,
      "FromDate": fromDate,
      "ToDate": toDate,
      "Accountcd": accountCd,
      "FromNumber": fromNumber,
      "ToNumber": toNumber,
      "FromNumber2": fromNumber2,
      "ToNumber2": toNumber2,
      "CategoryId": categoryId,
      "SaveTypeId": saveTypeId,
      "AccountLevel": accountLevel,
      "DisplayColumn": displayColumn,
      "WithEftetahie": withEftetahie,
      "WithEkhtetamieh": withEkhtetamieh,
      "WithTasir": withTasir,
      "WithSoodZian": withSoodZian,
      "WithZirSath": withZirSath,
      "WithBastanHesabhayeMovaqat": withBastanHesabhayeMovaqat,
      "WithEntezamiAccounts": withEntezamiAccounts,
      "WithFaqatGardeshDarha": withFaqatGardeshDarha,
      "WithFaqatMandeDarha": withFaqatMandeDarha,
      "WithFaqatMandeDarhayeBed": withFaqatMandeDarhayeBed,
      "WithFaqatMandeDarhayeBes": withFaqatMandeDarhayeBes,
    };
  }
}
