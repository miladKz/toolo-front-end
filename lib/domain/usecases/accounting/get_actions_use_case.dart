import '../../entities/accounting/accounting_action.dart';
import '../../repositories/accounting/account_repository.dart';

class GetActionsUseCase {
  final IAccountingRepository _repository;

  GetActionsUseCase(this._repository);

  @override
  Future<List<AccountingAction>> call() async {
    return _repository.getActions();
  }
}
