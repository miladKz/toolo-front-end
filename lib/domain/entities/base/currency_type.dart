import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

class CurrencyType extends IDropDownItem {
  final int id;
  final int neshaneNumber;
  final String neshaneStr;
  final int rowNumber;

  CurrencyType({required super.name, required this.id, required this.neshaneNumber, required this.neshaneStr, required this.rowNumber});



}