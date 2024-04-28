import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';

class CustomerDataDetailParamDto extends CustomerDataDetailParam {
  CustomerDataDetailParamDto(
      {required super.customerId, required super.valueType});

  Map<String, dynamic> toMap() {
    return {"MoshtarianID": customerId, "ValueType": valueType};
  }
}
