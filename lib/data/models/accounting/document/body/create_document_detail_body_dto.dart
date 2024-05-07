import 'package:toolo_gostar/domain/entities/accounting/document/body/create_document_detail_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/body/tafzili_data_body.dart';

class CreateDocumentDetailBodyDto extends CreateDocumentDetailBody {
  CreateDocumentDetailBodyDto(
      {required super.documentDetailBody, required super.tafziliDataBodyList});

  Map<String, dynamic> toMap() {
    return {
      "VoucherDetail": {
        "VoucherMSID": documentDetailBody.voucherMSID,
        "RowNumber": documentDetailBody.rowNumber,
        "Article": documentDetailBody.article,
        "AccountID": documentDetailBody.accountID,
        "Mablagh": documentDetailBody.mablagh,
        "Description": documentDetailBody.description,
        "ArzRowNumber": documentDetailBody.arzRowNumber,
        "ArzMablagh": documentDetailBody.arzMablagh,
        "NerkhBarabari": documentDetailBody.nerkhBarabari,
        "Value1": documentDetailBody.value1
      },
      "TafziliData": tafziliListData(tafziliDataBodyList),
    };
  }

  List<Map<String, dynamic>> tafziliListData(
      List<TafziliDataBody> tafziliDataBodyList) {
    List<Map<String, dynamic>> itemsMap = List.empty(growable: true);

    for (var item in tafziliDataBodyList) {
      itemsMap.add(
          {"TafziliGroupID": item.tafziliGroupID, "TafziliID": item.tafziliID});
    }

    return itemsMap;
  }
}
