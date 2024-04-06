import '../../entities/customers_and_sales/customer.dart';
import '../../repositories/customers_and_sales/customers_and_sales_repository.dart';

class GetCustomerListUseCase {
  final ICustomersAndSalesRepository _repository;

  GetCustomerListUseCase(this._repository);

  @override
  Future<List<Customer>> call() async {
    return _repository.getCustomerList();
  }
}
