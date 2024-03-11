import '../../../../domain/entities/fiscal/params/set_current_fiscal_year_param.dart';

class SetCurrentFiscalYearParamDto extends SetCurrentFiscalYearParam {
  SetCurrentFiscalYearParamDto({required super.activeYearId,required super.databaseId});

  Map<String, int> toMap() {
    return {"ActiveYearID": activeYearId,"DatabaseID":databaseId};
  }
}
