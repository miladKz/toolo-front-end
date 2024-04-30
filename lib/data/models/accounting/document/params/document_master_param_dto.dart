
import 'package:toolo_gostar/domain/entities/accounting/document/params/document_master_param.dart';

class DocumentMasterParamDto extends DocumentMasterParam {
  DocumentMasterParamDto({required super.bargeTypeID});

  Map<String, dynamic> toMap() {
    return {
      "BargeTypeID": bargeTypeID,
    };
  }
}
