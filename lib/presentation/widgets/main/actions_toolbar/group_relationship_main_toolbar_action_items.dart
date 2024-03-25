import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/question_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/base_toolbar_action_items.dart';

import '../../../../di/di.dart';
import '../../../blocs/main_bloc/main_bloc.dart';

List<Widget> groupRelationshipMainToolbarActionsItem(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 7 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.titleNew,
      onTap: () {},
    ),
    removeActionItem(
      objectWith,
      context,
      onTap: () {
        MainBloc mainBloc = locator.get<MainBloc>();
        if (mainBloc.selectedAccount != null) {
          showQuestionDialog(
            context: context,
            title: localization.remove,
            msg: localization.msgQuestionDelete,
            callBack: (isOk) {
              if (isOk) {}
            },
          );
        }
      },
    ),
    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
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
