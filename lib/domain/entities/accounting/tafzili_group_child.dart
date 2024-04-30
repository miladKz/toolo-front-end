import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class TafziliGroupChild extends IDropDownItem {
  final int id;
  final bool active;
  final String code;
  final int tafziliGroupCode;
  final String description;
  final bool isKarkonan;
  final bool isMoshtari;
  final bool isSarmayePazir;
  final bool isSayer;
  final bool isShoraka;
  final bool isTamin;
  final bool isTashilatDahande;
  final bool isTashilatGirande;
  final bool isVabaste;
  final bool isVasete;

  TafziliGroupChild(
      {required super.name,
      required this.id,
      required this.active,
      required this.code,
      required this.tafziliGroupCode,
      required this.description,
      required this.isKarkonan,
      required this.isMoshtari,
      required this.isSarmayePazir,
      required this.isSayer,
      required this.isShoraka,
      required this.isTamin,
      required this.isTashilatDahande,
      required this.isTashilatGirande,
      required this.isVabaste,
      required this.isVasete});
}
