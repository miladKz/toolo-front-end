import '../base/enums/customer_detail_type.dart';
import 'abstracts/table_row_data_abs.dart';

class CounterpartyDetail extends ITableRowData {
  CounterpartyDetail({
    required super.id,
    required super.name,
    required this.counterpartyId,
    required this.parentId,
    required this.value,
    required this.valueType,
  });

  int counterpartyId;
  int parentId;
  int valueType;
  String value;

  bool isModified = false;

  factory CounterpartyDetail.empty(CustomerDetailType customerDetailType) {
    return CounterpartyDetail(
      id: 0,
      valueType: customerDetailType.value,
      parentId: 0,
      value: '',
      name: '',
      counterpartyId: 0,
    );
  }

  get isNew => id < 1;

  @override
  List<Object?> get props => [name, value];
}
