import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

import '../common/abstracts/table_row_data_abs.dart';

class BankAccType extends IDropDownItem implements ITableRowData {
  @override
   int id;

  BankAccType({required super.name, required this.id});

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;

  @override
  set name(String _name) {
    name = _name;
  }
}
