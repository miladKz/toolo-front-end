import 'package:toolo_gostar/domain/entities/common/counterparty_detail.dart';

import '../../repositories/accounting/account_repository.dart';

class UpdateCounterpartyDetailUseCase {
  final IAccountingRepository _repository;

  UpdateCounterpartyDetailUseCase(this._repository);

  @override
  Future<CounterpartyDetail> call(CounterpartyDetail counterpartyDetail) async {
    return _repository.updateCounterpartyDetail(counterpartyDetail);
  }
}
