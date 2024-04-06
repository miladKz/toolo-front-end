import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/customer_and_sales/customer_dto.dart';
import 'package:toolo_gostar/domain/entities/customers_and_sales/customer.dart';

import '../../../domain/repositories/customers_and_sales/customers_and_sales_repository.dart';
import '../../common/models/server_response_dto.dart';
import '../../datasources/accounting/accounting_remote_data_source.dart';
import '../../datasources/auth/auth_local_data_source_impl.dart';

class CustomersAndSalesRepositoryImpl implements ICustomersAndSalesRepository {
  final AccountingRemoteDataSource remoteDataSource;
  final AuthLocalDataSourceImpl localDataSource;

  CustomersAndSalesRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Customer>> getCustomerList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getCustomerList(token: token,kind: 5);
      if (serverResponse.isSuccess) {
        List<CustomerDto> customerList = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        customerList = List<CustomerDto>.from(itemsAsMap.map((data) {
          return CustomerDto.fromMap(data);
        }));
        return customerList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getToken() {
    return localDataSource.getToken();
  }
}
