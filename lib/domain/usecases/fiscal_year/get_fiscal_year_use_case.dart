import 'package:toolo_gostar/domain/entities/fiscal/fiscal_year.dart';
import 'package:toolo_gostar/domain/repositories/fiscal_year/fiscal_repository.dart';

class GetFiscalYearsUseCase {
  final FiscalRepository _repository;

  GetFiscalYearsUseCase(this._repository);

  @override
  Future<List<FiscalYear>> call()  {
    return _repository.getFiscalYearData();
  }
}
