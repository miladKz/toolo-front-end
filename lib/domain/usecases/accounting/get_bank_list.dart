import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';

import '../../entities/common/counterparty.dart';
import '../../repositories/accounting/accounting_repository.dart';

class GetBankListUseCase {
  final IAccountingRepository _repository;

  GetBankListUseCase(this._repository);

  @override
  Future<List<Counterparty>> call() async {
    return _repository.getCounterpartyList(CounterPartyKinds.bank);
  }
}
