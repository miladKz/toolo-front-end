part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class AccountingEvent extends MainEvent {

}

class MainAccountList extends MainEvent{

}

class FilterActionsEvent extends MainEvent{
  final WorkSpaceItems selectedItem;
  FilterActionsEvent(this.selectedItem);
}
