import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/manage_bank/modals/generate_new_bank_modal.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/common/bank.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';

List<Widget> managementBankBranchMainToolbarActionItems(
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
                title: localization.titleCreateNewBank,
                width: maxWidth,
                body: GenerateNewBank(
                    formWidth: maxWidth, formKey: GlobalKey<FormState>(),
                bank: Bank(counterparty: Counterparty.empty())),
              );
            });
      },
    ),
    removeActionItem(
      objectWith,
      context,
      onTap: () {},
    ),
    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
      Bank? bank = mainBloc.getSelectedCounterparty<Bank>();
      if (bank != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: localization.updateBank,
                width: maxWidth,
                body: GenerateNewBank(
                    formWidth: maxWidth, formKey: GlobalKey<FormState>(),
                bank: bank),
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
