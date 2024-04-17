import 'package:toolo_gostar/domain/entities/base/customer_data_detail.dart';
import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchCustomerDataDetailListUseCase {
  final IAccountingRepository _repository;

  FetchCustomerDataDetailListUseCase(this._repository);

  @override
  Future<List<CustomerDataDetail>> call(
      {required CustomerDataDetailParam param}) async {
    return _repository.fetchCustomerDataDetailList(param);
  }
}
