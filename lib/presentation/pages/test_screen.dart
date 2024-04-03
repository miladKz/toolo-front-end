import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/factories/table_view_model_factory.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/common/card_number_box/card_number_box.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/account_party_form.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/main_form.dart';
import 'package:toolo_gostar/presentation/widgets/main/manage_bank/modals/generate_new_bank_modal.dart';


class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DataTableViewModel viewModel =
        DataTableViewModelFactory.createTableViewModelFromCities([]);

    DataTableViewModel viewModel2 =
        DataTableViewModelFactory.createTableViewModelFromRevolvingFund([]);

    DataTableViewModel bankModal =
        DataTableViewModelFactory.createTableViewModelBankList([]);

    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
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
                        double formWidth = 800;
                        return CustomDialog(
                            title: localization.titleAccountParty,
                            width: formWidth,
                            body: AccountPartyForm(
                              formWidth: formWidth,
                              formKey: GlobalKey<FormState>(),
                            ));

                        /// Pass your account data here
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
