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

class OnClickOnAccount extends MainEvent {
  final Account account;

  OnClickOnAccount(this.account);
}

class OnUpdateAccount extends MainEvent {
  final Account account;
  OnUpdateAccount(this.account);
}
class LoadUserData extends MainEvent {
}

class DeleteAccountEvent extends MainEvent {
 final Account account;
  DeleteAccountEvent(this.account);
}

class AddPinnedActionEvent extends MainEvent {
  final AccountingAction action;
  AddPinnedActionEvent(this.action);
}
class RemovePinnedActionEvent extends MainEvent {
  final AccountingAction action;
  RemovePinnedActionEvent(this.action);
}

