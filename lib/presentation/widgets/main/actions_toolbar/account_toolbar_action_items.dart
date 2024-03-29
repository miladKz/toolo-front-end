import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/question_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/base_toolbar_action_items.dart';

import '../../../../di/di.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../edit_group_dialog.dart';





List<Widget> accountToolbarActionsItem({required BuildContext context,required double maxWidth}) {
  double objectCount = 7 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.newAccount,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Account newAccount = Account.empty();
            newAccount.updateAccountLevel(0);
            return EditGroupDialog(
                account: newAccount,
                isNew: true); // Pass your account data here
          },
        );
      },
    ),
    addActionItem(
      objectWith,
      context,
      caption: localization.newGroup,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Account newAccount = Account.empty();
            newAccount.updateAccountLevel(0);
            return EditGroupDialog(
                account: newAccount,
                isNew: true); // Pass your account data here
          },
        );
      },
    ),
    removeActionItem(
      objectWith,
      context,
      onTap: () {
        MainBloc mainBloc = locator.get<MainBloc>();
        if (mainBloc.selectedDataTreeItem != null) {
          showQuestionDialog(
            context: context,
            title: localization.remove,
            msg: localization.msgQuestionDelete,
            callBack: (isOk) {
              if (isOk) {
                Account? account = mainBloc.getSelectedDataTreeItem<Account>();
                if (account != null) {
                  locator.get<MainBloc>().add(DeleteAccountEvent(account));
                }
              }
            },
          );
        }
      },
    ),
    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
      Account? account = mainBloc.getSelectedDataTreeItem<Account>();
      if (account != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return EditGroupDialog(account: account);
          },
        );
      }
    }),
    sendActionItem(
      objectWith,
      onTap: () {},
    ),
    refreshActionItem(
      objectWith,
      onTap: () {},
    ),
    printActionItem(
      objectWith,
      onTap: () {},
    ),
    disableActionItem(
      objectWith,
      onTap: () {},
    ),
  ];
}
