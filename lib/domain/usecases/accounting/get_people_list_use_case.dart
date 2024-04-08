import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../entities/common/counterparty.dart';

class GetPeopleListUseCase {
  final IAccountingRepository _repository;

  GetPeopleListUseCase(this._repository);

  @override
  Future<List<Counterparty>> call() async {
    return _repository.getCounterPartyList(CounterPartyKinds.people);
  }
}
