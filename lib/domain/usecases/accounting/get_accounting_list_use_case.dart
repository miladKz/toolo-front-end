import 'package:toolo_gostar/domain/entities/accounting/account.dart';

import '../../repositories/accounting/account_repository.dart';

class GetAccountListUseCase {
  final IAccountingRepository _repository;

  GetAccountListUseCase(this._repository);

  @override
  Future<List<Account>> call() async {
    return _repository.getAccountList();
  }
}
