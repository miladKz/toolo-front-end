import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/main.dart';

void showQuestionDialog(
    {required BuildContext context,
    required String title,
    required String msg,
    required Function(bool) callBack}) {
  final localization = locator.get<AppLocalizations>();
  final themeData = Theme.of(context);
  final textTheme = Theme.of(context).textTheme;
  if (!isDialogOpen) {
    final buttonTextStyle = textTheme.bodyMedium;
    Get.defaultDialog(
      title: title,
      backgroundColor: Colors.white,
      titleStyle:
          textTheme.titleLarge!.copyWith(color: themeData.colorScheme.primary),
      content: Text(
        msg,
        style: textTheme.bodyLarge!
            .copyWith(color: themeData.colorScheme.secondary),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: themeData.colorScheme.surface,
                foregroundColor: themeData.colorScheme.onSurface,
                textStyle: buttonTextStyle),
            onPressed: () {
              callBack(false);
              Get.back();
            },
            child: Text(localization.titleCancel)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: themeData.colorScheme.primary,
                foregroundColor: themeData.colorScheme.onPrimary,
                textStyle: buttonTextStyle),
            onPressed: () {
              callBack(true);
              Get.back();
            },
            child: Text(localization.titleSuccess)),
      ],
      barrierDismissible: false,
    );
  }
}
