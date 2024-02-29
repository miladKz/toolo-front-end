import '../../../entities/fiscal/params/set_current_fiscal_year_param.dart';
import '../../../repositories/fiscal/fiscal_repository.dart';

class SetCurrentFiscalYearUseCase {
  final FiscalRepository _repository;

  SetCurrentFiscalYearUseCase(this._repository);

  @override
  Future<int> call(SetCurrentFiscalYearParam activeYearId) async {
    return _repository.setCurrentFiscalYear(activeYearId);
  }
}
