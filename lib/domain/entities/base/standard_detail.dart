import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class StandardDetail extends IDropDownItem implements ITableRowData {
  @override
  int id;

  @override
  String name;

  int bargeTypeID;
  String description;
  int section;

  StandardDetail(
      {required this.name,
      required this.id,
      required this.bargeTypeID,
      required this.description,
      required this.section})
      : super(name: name);

  factory StandardDetail.empty() {
    return StandardDetail(
      id: 0,
      bargeTypeID: 0,
      section: 0,
      name: '',
      description: '',
    );
  }

  @override
  List<Object?> get props => [description];

  @override
  bool? get stringify => true;
}
