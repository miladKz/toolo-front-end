import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_child.dart';

class TafziliGroupChildDto extends TafziliGroupChild {
  TafziliGroupChildDto(
      {required super.name,
      required super.id,
      required super.active,
      required super.code,
      required super.tafziliGroupCode,
      required super.description,
      required super.isKarkonan,
      required super.isMoshtari,
      required super.isSarmayePazir,
      required super.isSayer,
      required super.isShoraka,
      required super.isTamin,
      required super.isTashilatDahande,
      required super.isTashilatGirande,
      required super.isVabaste,
      required super.isVasete});

  factory TafziliGroupChildDto.fromMap(Map<String, dynamic> map) {
      return TafziliGroupChildDto(
          id: map.findAsInt('ID'),
          name: map.findAsString('Name'),
          active: map.findAsBool('Active'),
          code: map.findAsString('Code'),
          tafziliGroupCode: map.findAsInt('TafziliGroupCode'),
          description: map.findAsString('Description'),
          isKarkonan: map.findAsBool('IsKarkonan'),
          isMoshtari: map.findAsBool('IsMoshtari'),
          isSarmayePazir: map.findAsBool('IsSarmayePazir'),
          isSayer: map.findAsBool('IsSayer'),
          isShoraka: map.findAsBool('IsShoraka'),
          isTamin: map.findAsBool('IsTamin'),
          isTashilatDahande: map.findAsBool('IsTashilatDahande'),
          isTashilatGirande: map.findAsBool('IsTashilatGirande'),
          isVabaste: map.findAsBool('IsVabaste'),
          isVasete: map.findAsBool('IsVasete'),
      );
  }
}
