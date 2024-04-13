import 'package:toolo_gostar/domain/entities/common/counterparty.dart';

import '../../repositories/accounting/account_repository.dart';

class DeleteCounterpartyUseCase {
  final IAccountingRepository _repository;

  DeleteCounterpartyUseCase(this._repository);

  @override
  Future<String> call(Counterparty counterparty) async {
    return _repository.deleteCounterparty(counterparty);
  }
}
