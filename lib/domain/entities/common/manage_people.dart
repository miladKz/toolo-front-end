import 'abstracts/table_row_data_abs.dart';

class ManagePeople extends ITableRowData {
  ManagePeople({
    required super.id,
    required this.code,
    required this.name,
    required this.nationalID,
    required this.nickname,
  });

  int code;
  String nickname;
  String name;
  int nationalID;

  @override
  List<Object?> get props => [code, nickname, name, nationalID];
}
