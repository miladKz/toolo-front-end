import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import 'account_tree_view.dart';

class AccountTreeViewBuilder extends StatefulWidget {
  List<Account> items = List.empty();

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
    return Expanded(
      child: widget.items.isNotEmpty
          ? ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return AccountTreeView(account: widget.items[index]);
        },
      )
          : const Center(
        child: Text(
          'There is no data for this section',
          style: TextStyle(
              fontSize: 18,
              color: Colors.black38,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void updateList() {
    final state = context.watch<MainBloc>().state;
    if (state is MainAccountSuccess) {
      widget.items = state.accounts;
    }
  }
}