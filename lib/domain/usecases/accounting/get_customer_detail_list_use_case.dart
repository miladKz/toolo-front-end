import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

class GetCustomerDetailListUseCase {
  final IAccountingRepository _repository;

  GetCustomerDetailListUseCase(this._repository);

  @override
  Future<List<CounterpartyDetail>> call(
      {required CustomerDataDetailParam customerDataDetailParam}) async {
    return _repository.getCustomerDetailList(customerDataDetailParam);
  }
}
