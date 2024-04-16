import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/people_modal.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/common/people.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';
import '../../../../question_dialog.dart';

List<Widget> managePeopleMainToolbarActionItems(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 6 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.titleNew,
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                  title: localization.newCounterparty,
                  width: maxWidth,
                  body: PeopleModal(
                    formWidth: maxWidth,
                    formKey: GlobalKey<FormState>(),
                    people: People(counterparty: Counterparty.empty())
                  ));
            });
      },
    ),
    removeActionItem(
      objectWith,
      context,
      onTap: () {
        MainBloc mainBloc = locator.get<MainBloc>();
        People? people = mainBloc.getSelectedCounterparty<People>();
        if (people != null) {
          showQuestionDialog(
            context: context,
            title: localization.remove,
            msg: localization.msgQuestionDelete,
            callBack: (isOk) {
              if (isOk) {
                locator.get<MainBloc>().add(OnDeleteCounterparty(people));
              }
            },
          );
        }
      },
    ),
    editActionItem(
      objectWith,
      context,
      onTap: () {
        MainBloc mainBloc = locator.get<MainBloc>();
        People? people = mainBloc.getSelectedCounterparty<People>();
        if (people != null ) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: localization.editCardReader,
                  width: maxWidth,
                  body: PeopleModal(
                    formWidth: maxWidth,
                    formKey: GlobalKey<FormState>(),
                    people: people
                  ),
                );
              });
        }
      },
    ),
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
