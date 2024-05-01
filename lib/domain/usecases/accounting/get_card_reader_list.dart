import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';

import '../../entities/common/counterparty.dart';
import '../../repositories/accounting/accounting_repository.dart';

class GetCardReaderListUseCase {
  final IAccountingRepository _repository;

  GetCardReaderListUseCase(this._repository);

  @override
  Future<List<Counterparty>> call() async {
    return _repository.getCounterpartyList(CounterPartyKinds.cardReader);
  }
}
