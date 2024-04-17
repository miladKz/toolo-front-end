import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchCustomerStatusListUseCase {
  final IAccountingRepository _repository;

  FetchCustomerStatusListUseCase(this._repository);

  @override
  Future<List<CustomerStatus>> call() async {
    return _repository.fetchCustomerStatusList();
  }
}
