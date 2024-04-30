import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_child.dart';

class TafziliGroupAndChildren {
  final int id;
  final String code;
  final String name;
  final int type;
  final List<TafziliGroupChild> tafziliList;

  TafziliGroupAndChildren(
      {required this.id,
      required this.code,
      required this.name,
      required this.type,
      required this.tafziliList});
}
