import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/edit_account_form.dart';

import '../../../domain/entities/accounting/account.dart';
import 'forms/edit_gorup_form.dart';

class EditGroupDialog extends StatelessWidget {
  final Account account;
  bool isNew;

  EditGroupDialog({Key? key, required this.account, this.isNew = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero, // Remove padding around the dialog
      child: BlocProvider<MainBloc>.value(
        value: locator.get<MainBloc>(),
        child: SingleChildScrollView(
          child: account.accountLevel == 0
              ? EditGroupForm(
                  account: account,
                  isNew: isNew,
                )
              : EditAccountForm(account: account, isNew: isNew),
        ),
      ),
    );
  }
}