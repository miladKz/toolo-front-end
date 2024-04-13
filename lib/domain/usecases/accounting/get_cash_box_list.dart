import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';

import '../../entities/common/counterparty.dart';
import '../../repositories/accounting/account_repository.dart';

class GetCashBoxListUseCase {
  final IAccountingRepository _repository;

  GetCashBoxListUseCase(this._repository);

  @override
  Future<List<Counterparty>> call() async {
    return _repository.getCounterpartyList(CounterPartyKinds.cashBox);
  }
}
