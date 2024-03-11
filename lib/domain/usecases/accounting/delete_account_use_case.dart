import '../../entities/accounting/account.dart';
import '../../repositories/accounting/account_repository.dart';

class DeleteAccountUseCase {
  final IAccountingRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<String> call(Account account) async {
    return _repository.deleteAccount(account);
  }
}
