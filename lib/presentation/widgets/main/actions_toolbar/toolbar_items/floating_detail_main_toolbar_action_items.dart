import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/floating_detail_form.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/main_form.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';

List<Widget> floatingDetailMainToolbarActionItems(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 6 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.titleFloatingDetail,
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: localization.titleFloatingDetail,
                width: maxWidth,
                body: FloatingDetailForm(
                  formWidth: maxWidth,
                  formKey: GlobalKey<FormState>(),
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
