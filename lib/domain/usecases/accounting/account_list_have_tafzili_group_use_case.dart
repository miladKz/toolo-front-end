import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import '../../repositories/accounting/account_repository.dart';

class FetchAccountListHaveTafziliGroupUseCase {
  final IAccountingRepository _repository;

  FetchAccountListHaveTafziliGroupUseCase(this._repository);

  @override
  Future<List<AccountHaveTafziliGroup>> call() async {
    try {
      return _repository.fetchAccountsListHaveTafziliGroup();
    } catch (e) {
      throw e.toString();
    }
  }
}
