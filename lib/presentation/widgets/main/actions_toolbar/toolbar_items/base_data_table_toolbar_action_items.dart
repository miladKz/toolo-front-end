import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';

import '../../../../../di/di.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';

List<Widget> baseDataTableToolbarActionItems(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 6 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.titleNew,
      onTap: () {},
    ),

    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
    }),
    showActionItem(objectWith, context, onTap: () {
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
  ];
}
