import '../enums/customer_detail_type.dart';

class CustomerDataDetailParam {
  final int customerId;
  CustomerDetailType valueType;

  CustomerDataDetailParam({required this.customerId, required this.valueType});
}
