import 'package:equatable/equatable.dart';

abstract class ITableRowData extends Equatable {
   int id;
  String name;

  ITableRowData({required this.id, required this.name});

  @override
  List<Object?> get props => [id];
}
