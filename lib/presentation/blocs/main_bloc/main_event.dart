part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainActionList extends MainEvent {}

class MainAccountList extends MainEvent {}

class MainAnotherList extends MainEvent {
  final String endpoint;

  MainAnotherList({required this.endpoint});
}

class FilterActionsEvent extends MainEvent {
  final WorkSpaceItems selectedItem;

  FilterActionsEvent(this.selectedItem);
}
