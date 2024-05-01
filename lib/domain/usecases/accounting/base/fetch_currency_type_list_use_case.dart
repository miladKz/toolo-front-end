import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

class FetchCurrencyTypeListUseCase {
  final IAccountingRepository _repository;

  FetchCurrencyTypeListUseCase(this._repository);

  @override
  Future<List<CurrencyType>> call() async {
    return _repository.fetchCurrencyTypeList();
  }
}
