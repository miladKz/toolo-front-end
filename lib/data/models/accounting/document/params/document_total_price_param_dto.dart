

import 'package:toolo_gostar/domain/entities/accounting/document/params/document_total_price_param.dart';

class DocumentTotalPriceParamDto extends DocumentTotalPriceParam {
  DocumentTotalPriceParamDto({required super.voucherMSID, required super.articleID});


  Map<String, dynamic> toMap() {
    return {
      "VoucherMSID": voucherMSID,
      "articleID": articleID,
    };
  }
}
