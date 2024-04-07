import 'package:equatable/equatable.dart';

abstract class ITableRowData extends Equatable {
  final int id;

  const ITableRowData({required this.id});

  @override
  List<Object?> get props => [id];
}
