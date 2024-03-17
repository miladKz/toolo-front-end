import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/forms/counterparty_form.dart';

import '../../domain/entities/accounting/account.dart';
import '../widgets/common/forms/floating_detail_form.dart';
import '../widgets/common/forms/form_elements/main_form.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        body: Center(
          child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    Account newAccount = Account.empty();
                    double formWidth = 700;
                    return MainForm(
                      title: "ویرایش طرف حساب ها",
                      width: formWidth,
                      body: CounterpartyForm(
                          formWidth: formWidth,
                          formKey: _formKey),
                    ); // Pass your account data here
                  },
                );
              },
              child: Text("click")),
        ),
      ),
    );
  }
}
