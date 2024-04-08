import 'package:flutter/material.dart';

import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../../main.dart';
import '../factories/table_view_model_factory.dart';
import '../view_models/table_view_model.dart';
import '../widgets/common/modals/card_reader_modal.dart';
import '../widgets/common/modals/modal_elements/custom_dialog.dart';
import '../widgets/main/actions_toolbar/actions_toolbar.dart';
import '../widgets/main/actions_toolbar/toolbar_enum.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    City city = City(id: 1, name: 'کرج', province: 'البرز', code: 0);
    City city2 = City(id: 2, name: 'تهران', province: 'تهران',code: 1);
    DataTableViewModel viewModel =
    DataTableViewModelFactory.createTableViewModelFromCities([city, city2]);

    /*RevolvingFund tankhah = RevolvingFund(description: "تنخواه دستگاه مرکزی", id: 1);
    RevolvingFund tankhah2 = RevolvingFund(description: "تنخواه کارخانه", id: 2);*/
    DataTableViewModel viewModel2 =
    DataTableViewModelFactory.createTableViewModelFromRevolvingFund(
            [/*tankhah2, tankhah*/]);

    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              myCustomToolbar(
                  toolBarEnum:
                      ToolBarEnum.groupRelationshipManagementModalToolbar),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        //double formWidth = MediaQuery.of(context).size.width;
                        double formWidth = 400;
                        return CustomDialog(
                          title: localization
                              .titleGroupRelationshipAndLastLevelAccountCode,
                          width: formWidth,
                          body: CardReaderModal(
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
