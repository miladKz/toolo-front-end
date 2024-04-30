import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/jalali_date_picker.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/documents/modals/new_document_row_modal.dart';

import '../../domain/entities/common/city.dart';
import '../factories/table_view_model_factory.dart';
import '../view_models/table_view_model.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    City city = City(id: 1, name: 'کرج', cityCode: "0",fullCode: "0",fullName: '',stateCode: "0",stateName: 'البرز');
    City city2 = City(id: 1, name: 'تهران', cityCode: "0",fullCode: "0",fullName: '',stateCode: "0",stateName: 'البرز');

    DataTableViewModel viewModel =
        DataTableViewModelFactory.createTableViewModelFromCityList([city, city2]);

    /*RevolvingFund tankhah = RevolvingFund(description: "تنخواه دستگاه مرکزی", id: 1);
    RevolvingFund tankhah2 = RevolvingFund(description: "تنخواه کارخانه", id: 2);*/
    DataTableViewModel viewModel2 =
        DataTableViewModelFactory.createTableViewModelFromRevolvingFund([
      /*tankhah2, tankhah*/
    ]);

    return Material(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  JalaliDatePicker.convertJalaliToGregorian(
                      dateAsStr: '1403/02/09');
                  JalaliDatePicker.convertJalaliToGregorian(
                      dateAsStr: '1370/12/30');
                  JalaliDatePicker.convertJalaliToGregorian(
                      dateAsStr: '1350/01/31');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //double formWidth = MediaQuery.of(context).size.width;
                      double formWidth = 800;
                      return CustomDialog(
                        title: localization.titleNewRow,
                        width: formWidth,
                        body: NewDocumentRowModal(
                          formWidth: formWidth,
                          formKey: _formKey,
                          voucherMSID: 10,
                          onCreateOrUpdateStatus: (bool isSuccess) {},
                        ),
                      ); // Pass your account data here
                    },
                  );
                },
                child: const Text("click")),
          ],
        ),
      ),
    ));
  }
}
