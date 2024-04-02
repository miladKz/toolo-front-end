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

import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../../main.dart';
import '../factories/table_view_model_factory.dart';
import '../view_models/table_view_model.dart';
import '../widgets/common/modals/modal_elements/main_form.dart';
import '../widgets/common/modals/new_card_reader_modal.dart';
import '../widgets/common/modals/revolving_fund_modal.dart';
import '../widgets/main/actions_toolbar/actions_toolbar.dart';
import '../widgets/main/actions_toolbar/toolbar_enum.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    City city = City(id: 1, name: 'کرج', province: 'البرز');
    City city2 = City(id: 2, name: 'تهران', province: 'تهران');
    TableViewModel viewModel =
        TableViewModelFactory.createTableViewModelFromCities([city, city2]);

    RevolvingFund tankhah = RevolvingFund(description: "تنخواه دستگاه مرکزی");
    RevolvingFund tankhah2 = RevolvingFund(description: "تنخواه کارخانه");
    TableViewModel viewModel2 =
        TableViewModelFactory.createTableViewModelFromRevolvingFund(
            [tankhah2, tankhah]);

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
                        double formWidth = 400;
                        return MainForm(
                          title: localization
                              .newRevolvingFund,
                          width: formWidth,
                          body: RevolvingFundModal(
                            formWidth: formWidth,
                            formKey: _formKey,
                            isActive: true,
                          ),
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
