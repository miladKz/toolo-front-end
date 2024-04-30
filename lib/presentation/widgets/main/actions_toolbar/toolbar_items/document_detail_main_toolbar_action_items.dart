import 'package:flutter/material.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/pages/screen_document_detail.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/main_base_body.dart';
DocumentMaster? selectedDocumentMaster;
List<Widget> documentDetailMainToolbarActionItems(
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
              return ShowCreateOrUpdateDocumentDetailModal(
                  maxWidth: maxWidth, isCreate: true);
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
    editActionItem(objectWith, context, onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ShowCreateOrUpdateDocumentDetailModal(
                maxWidth: maxWidth, isCreate: true);
          });
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
