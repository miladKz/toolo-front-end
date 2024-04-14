import 'package:flutter/material.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/domain/entities/common/revolving_fund.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/revolving_fund_modal.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';

import '../../../../question_dialog.dart';

List<Widget> revolvingFundMainToolbarActionItems(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 5 + 1;
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
                title: localization.newRevolvingFund,
                width: maxWidth,
                body: RevolvingFundModal(
                  formWidth: maxWidth,
                  formKey: GlobalKey<FormState>(),
                  revolvingFund:
                      RevolvingFund(counterparty: Counterparty.empty()),
                ),
              );
            });
      },
    ),
    /*addActionItem(
      objectWith,
      context,
      caption: localization.titleFloatingDetailGroup,
      onTap: () {

      },
    ),*/
    removeActionItem(
      objectWith,
      context,
      onTap: () {
        MainBloc mainBloc = locator.get<MainBloc>();
        RevolvingFund? revolvingFund =
            mainBloc.getSelectedCounterparty<RevolvingFund>();
        if (revolvingFund != null) {
          showQuestionDialog(
            context: context,
            title: localization.remove,
            msg: localization.msgQuestionDelete,
            callBack: (isOk) {
              if (isOk) {
                locator
                    .get<MainBloc>()
                    .add(OnDeleteCounterparty(revolvingFund));
              }
            },
          );
        }
      },
    ),
    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
      RevolvingFund? selectedRevolvingFund =
          mainBloc.getSelectedCounterparty<RevolvingFund>();
      if (selectedRevolvingFund != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: localization.updateRevolvingFund,
                width: maxWidth,
                body: RevolvingFundModal(
                  formWidth: maxWidth,
                  formKey: GlobalKey<FormState>(),
                  revolvingFund: selectedRevolvingFund,
                ),
              );
            });
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
  ];
}
