import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/widgets/main/edit_group_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/generic_tree_view.dart';
import 'package:toolo_gostar/presentation/widgets/main/main_base_body.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../blocs/main_bloc/main_bloc.dart';

class AccountTreeViewBuilder extends StatefulWidget {
  final List<Account> items = List.empty(growable: true);

  AccountTreeViewBuilder({
    super.key,
  });

  @override
  State<AccountTreeViewBuilder> createState() =>
      _AccountTreeViewBuilderState();
}

class _AccountTreeViewBuilderState extends State<AccountTreeViewBuilder> {
  @override
  Widget build(BuildContext context) {
    updateList();
    return Flexible(
        child: widget.items.isNotEmpty
            ? ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return GenericTreeView(
                    model: widget.items[index],
                    onCallBack: ({required isOnDouble, required item}) {
                      Account account = item as Account;
                      debugPrint('select account ${account.description}');
                      selectItem(account);
                      if (isOnDouble) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditGroupDialog(
                              account: account,
                            ); // Pass your account data here
                          },
                        );
                      }
                    },
                  );
                },
              )
            : emptyData());
  }

  void updateList() {
    final state = context.watch<MainBloc>().state;
    if (state is MainAccountSuccess) {
      widget.items.clear();
      widget.items.addAll(state.accounts);
    }
  }
}
void selectItem(Account account) {
  locator.get<MainBloc>().add(OnClickOnAccount(account));
}
