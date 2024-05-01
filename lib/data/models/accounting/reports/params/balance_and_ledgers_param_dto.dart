import '../../../../../domain/entities/accounting/reports/params/balance_and_ledgers_param.dart';

class BalanceAndLedgersParamDto extends BalanceAndLedgersParam {
  const BalanceAndLedgersParamDto({
    required super.activeYear,
    required super.fromDate,
    required super.toDate,
    required super.accountCd,
    required super.fromNumber,
    required super.toNumber,
    required super.fromNumber2,
    required super.toNumber2,
    required super.categoryId,
    required super.saveTypeId,
    required super.withOpening,
    required super.withClosing,
    required super.withEffect,
    required super.withProfitAndLoss,
    required super.accountLevel,
    required super.withSubLevels,
  });

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
      "BargeTypeID": categoryId,
      "SaveTypeID": saveTypeId,
      "WithEftetahie": withOpening,
      "WithEkhtetamieh": withClosing,
      "WithTasir": withEffect,
      "WithSoodZian": withProfitAndLoss,
      "AccountLevel": accountLevel,
      "WithZirSath": withSubLevels
    };
  }
}
