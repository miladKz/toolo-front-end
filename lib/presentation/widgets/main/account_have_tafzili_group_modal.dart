import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/factories/table_view_model_factory.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/custom_view_with_data_table.dart';

class AccountHaveTafziliGroupModal extends StatefulWidget {
  final Function(AccountHaveTafziliGroup) onSelected;

  AccountHaveTafziliGroupModal({super.key, required this.onSelected});

  @override
  State<AccountHaveTafziliGroupModal> createState() =>
      _AccountHaveTafziliGroupModalState();
}

class _AccountHaveTafziliGroupModalState
    extends State<AccountHaveTafziliGroupModal> {
  List<AccountHaveTafziliGroup> accountList = List.empty(growable: true);

  bool isFetchData = false;

  @override
  Widget build(BuildContext context) {
    if (!isFetchData) {
      locator.get<MainBloc>().add(MainFetchAccountHaveTafziliGroup());
    }
    listenToFetchData();
    return isFetchData
        ? accountView(accountList: accountList)
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget accountView({required List<AccountHaveTafziliGroup> accountList}) {
    DataTableViewModel dataTableViewModel = DataTableViewModelFactory
        .createTableViewModelFromAccountHaveTafziliGroup(
        accountList: accountList);
    final formKey = GlobalKey<FormState>();
    return LayoutBuilder(builder: (context, constraints) {
      double tableWidth=constraints.maxWidth;
      return CustomViewWithDataTable(
          isShowActionButtons: false,
          isShowSearchBox: true,
          backgroundColor: const Color(0xffF8F8F8),
          formWidth: tableWidth,
          onTap: (data) {
            AccountHaveTafziliGroup documentDetail=data as AccountHaveTafziliGroup;
            widget.onSelected(documentDetail);

          },
          viewModel: dataTableViewModel,
          formKey: formKey);
    },);

  }

  void listenToFetchData() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessFetchAccountHaveTafziliGroup) {
      setState(() {
        isFetchData = true;
        accountList = state.items;
      });
    }
  }
}
