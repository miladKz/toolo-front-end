
import 'package:toolo_gostar/domain/entities/accounting/document/params/document_master_detail_param.dart';

class DocumentMasterDetailParamDto extends DocumentMasterDetailParam {
  DocumentMasterDetailParamDto({required super.voucherMSID});

  //todo change VoucherMSID value with input data
  Map<String, dynamic> toMap() {
    return {
      "VoucherMSID": voucherMSID,
    };
  }
}
