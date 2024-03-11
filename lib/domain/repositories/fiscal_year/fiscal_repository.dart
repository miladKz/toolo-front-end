import '../../entities/fiscal/fiscal_year.dart';
import '../../entities/fiscal/params/set_current_fiscal_year_param.dart';

abstract class FiscalRepository {
  Future<List<FiscalYear>> getFiscalYearData();

  Future<int> setCurrentFiscalYear(SetCurrentFiscalYearParam activeYearId);
}
