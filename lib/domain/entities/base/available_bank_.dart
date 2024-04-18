import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';

import '../common/abstracts/table_row_data_abs.dart';

class AvailableBank extends IDropDownItem implements ITableRowData {
  @override
  final int id;
  final int code;

  AvailableBank({required super.name, required this.code, required this.id});

  @override
  List<Object?> get props => [name];

  @override
  bool? get stringify => true;

  @override
  set name(String _name) {
    name = _name;
  }
}
