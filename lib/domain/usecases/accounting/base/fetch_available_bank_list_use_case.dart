import 'package:toolo_gostar/domain/entities/base/available_bank_.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchAvailableBankListUseCase {
  final IAccountingRepository _repository;

  FetchAvailableBankListUseCase(this._repository);

  @override
  Future<List<AvailableBank>> call() async {
    return _repository.fetchAvailableBankList();
  }
}
