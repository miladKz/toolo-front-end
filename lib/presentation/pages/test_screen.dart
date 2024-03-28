import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/card_number_box/card_number_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/actions_toolbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/detailed_account_and_group_relationship_management/modals/group_relationship_management_modal.dart';
import 'package:toolo_gostar/presentation/widgets/main/manage_bank/modals/generate_new_bank_modal.dart';

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
          child: Column(
            children: [
              MyCustomToolbar(
                  toolBarEnum: ToolBarEnum.groupRelationshipManagementModalToolbar),
              const SizedBox(
                height: 50,
              ),

              cardNumberBox(),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        //double formWidth = MediaQuery.of(context).size.width;
                        double formWidth = 800;
                        return MainForm(
                          title: localization.titleGroupRelationshipAndLastLevelAccountCode,
                          width: formWidth,
                          body: GenerateNewBank(
                              formWidth: formWidth, formKey: _formKey,isActive: true,),
                        ); // Pass your account data here
                      },
                    );
                  },
                  child: const Text("click")),
            ],
          ),
        ),
      ),
    );
  }
}
