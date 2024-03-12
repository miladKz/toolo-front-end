import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/edit_account_form.dart';

import '../../../domain/entities/accounting/account.dart';
import 'forms/edit_gorup_form.dart';

class EditGroupDialog extends StatelessWidget {
  final Account account;

  const EditGroupDialog({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero, // Remove padding around the dialog
      child: SingleChildScrollView(
        child: account.accountLevel == 0 ? EditGroupForm(account: account): EditAccountForm(account: account),
      ),
    );
  }
}