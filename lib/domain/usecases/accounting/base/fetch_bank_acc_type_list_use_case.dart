import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchBankAccTypeListUseCase {
  final IAccountingRepository _repository;

  FetchBankAccTypeListUseCase(this._repository);

  @override
  Future<List<BankAccType>> call() async {
    return _repository.fetchBankAccTypeList();
  }
}
