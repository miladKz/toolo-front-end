import 'package:toolo_gostar/domain/entities/common/counterparty.dart';

import '../../entities/accounting/account.dart';
import '../../repositories/accounting/accounting_repository.dart';

class UpdateCounterpartyUseCase {
  final IAccountingRepository _repository;

  UpdateCounterpartyUseCase(this._repository);

  @override
  Future<Counterparty> call(Counterparty counterparty) async {
    try {
      return _repository.updateCounterparty(counterparty);
    } catch (e) {
      throw e.toString();
    }
  }
}
