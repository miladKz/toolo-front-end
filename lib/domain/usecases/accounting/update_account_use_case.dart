import '../../entities/accounting/account.dart';
import '../../repositories/accounting/account_repository.dart';

class UpdateAccountUseCase {
  final IAccountingRepository _repository;

  UpdateAccountUseCase(this._repository);

  @override
  Future<Account> call(Account account) async {
    return _repository.updateAccount(account);
  }
}
