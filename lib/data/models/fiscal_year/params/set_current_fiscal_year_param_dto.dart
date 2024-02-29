import '../../../../domain/entities/fiscal/params/set_current_fiscal_year_param.dart';

class SetCurrentFiscalYearParamDto extends SetCurrentFiscalYearParam {
  SetCurrentFiscalYearParamDto({required super.id});

  Map<String, int> toMap() {
    return {"ActiveYearID": id};
  }
}
