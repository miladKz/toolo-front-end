import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/detailed_account_and_group_relationship_management/modals/group_relationship_management_modal.dart';

List<Widget> groupRelationshipModalToolbarActionItems(
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
                  title: localization
                      .titleGroupRelationshipAndLastLevelAccountCode,
                  width: maxWidth,
                  body: ModalGroupRelationshipManagement(
                    formWidth: maxWidth,
                    formKey: GlobalKey<FormState>(),
                    detailGroups: const [],
                  ));
            });
      },
    ),

    editActionItem(objectWith, context, onTap: () {
    }),
    showActionItem(objectWith, context, onTap: () {
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
