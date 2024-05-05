import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class DetailGroupRoot extends IDropDownItem implements ITableRowData {
  @override
  final int id;
  final int code;
  final int type;

  DetailGroupRoot(
      {required super.name,
      required this.id,
      required this.code,
      required this.type});

  @override
  List<Object?> get props => [code, name];

  @override
  set id(int id) {
    this.id = id;
  }

  @override
  set name(String name) {
    this.name = name;
  }

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
