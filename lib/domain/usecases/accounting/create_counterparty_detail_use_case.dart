import 'package:toolo_gostar/domain/entities/common/counterparty_detail.dart';

import '../../repositories/accounting/accounting_repository.dart';

class CreateCounterpartyDetailUseCase {
  final IAccountingRepository _repository;

  CreateCounterpartyDetailUseCase(this._repository);

  @override
  Future<CounterpartyDetail> call(CounterpartyDetail counterpartyDetail) async {
    return _repository.createCounterpartyDetail(counterpartyDetail);
  }
}
