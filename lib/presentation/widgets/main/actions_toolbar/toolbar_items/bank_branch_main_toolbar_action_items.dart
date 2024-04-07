import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/main_form.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/manage_bank/modals/generate_new_bank_modal.dart';

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
                    formWidth: maxWidth, formKey: GlobalKey<FormState>()),
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
      onTap: () {},
    ),
    editActionItem(objectWith, context, onTap: () {}),
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
