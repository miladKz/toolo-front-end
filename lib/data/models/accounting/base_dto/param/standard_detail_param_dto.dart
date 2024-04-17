import 'package:toolo_gostar/domain/entities/base/param/standard_detail_param.dart';

class StandardDetailParamDto extends StandardDetailParam {
  StandardDetailParamDto({required super.bargeTypeID, required super.section});


  Map<String, dynamic> toMap() {
    return {"BargeTypeID": bargeTypeID, "Section": section};
  }
}
