import '../../entities/accounting/account.dart';
import '../../repositories/accounting/account_repository.dart';

class CreateAccountUseCase {
  final IAccountingRepository _repository;

  CreateAccountUseCase(this._repository);

  @override
  Future<Account> call(Account account) async {
    return _repository.createAccount(account);
  }
}
