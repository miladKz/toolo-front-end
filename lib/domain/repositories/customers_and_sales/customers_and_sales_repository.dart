import '../../entities/customers_and_sales/customer.dart';

abstract class ICustomersAndSalesRepository {
  Future<List<Customer>> getCustomerList();
}
