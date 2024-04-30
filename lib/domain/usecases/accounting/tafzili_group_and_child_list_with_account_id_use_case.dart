import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_and_child.dart';

import '../../repositories/accounting/account_repository.dart';

class FetchTafziliGroupAndChildListWithAccountIdUseCase {
  final IAccountingRepository _repository;

  FetchTafziliGroupAndChildListWithAccountIdUseCase(this._repository);

  @override
  Future<List<TafziliGroupAndChildren>> call(
      {required int accountId}) async {
    try {
      return _repository.fetchTafziliAllDataList(accountId: accountId);
    } catch (e) {
      throw e.toString();
    }
  }
}
