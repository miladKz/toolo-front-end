import '../../entities/accounting/account.dart';
import '../../repositories/accounting/account_repository.dart';

class UpdateAccountUseCase {
  final IAccountingRepository _repository;

  UpdateAccountUseCase(this._repository);

  @override
  Future<Account> call(Account account) async {
    try{
      return _repository.updateAccount(account);
    }catch(e){
      throw e.toString();
    }

  }
}
