import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/tafzili_data.dart';

class TafziliDataDto extends TafziliData {
  TafziliDataDto(
      {required super.id,
      required super.meghdar,
      required super.nerkhBarabari,
      required super.orderIndex,
      required super.tafziliCode,
      required super.tafziliGroupCode,
      required super.tafziliGroupName,
      required super.tafziliID,
      required super.tafziliName,
      required super.voucherDTID});

  factory TafziliDataDto.fromMap(Map<String, dynamic> map) {
      return TafziliDataDto(
          id: map.findAsInt('ID'),
          meghdar: map.findAsDouble('Meghdar'),
          nerkhBarabari:  map.findAsInt('NerkhBarabari'),
          orderIndex:  map.findAsInt('orderIndex'),
          tafziliCode:  map.findAsString('TafziliCode'),
          tafziliGroupCode:  map.findAsInt('TafziliGroupCode'),
          tafziliGroupName:  map.findAsString('TafziliGroupName'),
          tafziliID:  map.findAsInt('TafziliID'),
          tafziliName:  map.findAsString('TafziliName'),
          voucherDTID:  map.findAsInt('VoucherDTID'),
      );
  }
}
