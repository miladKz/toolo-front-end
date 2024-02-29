
import '../../../entities/fiscal/fiscal_year.dart';
import '../../../repositories/fiscal/fiscal_repository.dart';

class GetFiscalYearsUseCase {
  final FiscalRepository _repository;

  GetFiscalYearsUseCase(this._repository);

  @override
  Future<List<FiscalYear>> call() async {
    return _repository.getFiscalYearData();
  }
}
