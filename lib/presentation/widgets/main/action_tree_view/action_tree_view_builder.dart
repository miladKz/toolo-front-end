import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/accounting/accounting_action.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import 'action_tree_view.dart';

class ActionsTreeViewBuilder extends StatefulWidget {
  List<AccountingAction> items = List.empty();

  ActionsTreeViewBuilder({
    super.key,
  });

  @override
  State<ActionsTreeViewBuilder> createState() => _ActionsTreeViewBuilderState();
}

class _ActionsTreeViewBuilderState extends State<ActionsTreeViewBuilder> {
  @override
  Widget build(BuildContext context) {
    updateList();
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(11)),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return widget.items.isNotEmpty
                ? ActionTreeView(item: widget.items[0], isRoot: true)
                : const SizedBox();
          },
        ));
  }

  updateList() {
    final bloc = context.watch<MainBloc>();

     if (bloc.filteredActions.isNotEmpty) {
      widget.items = bloc.filteredActions;
    }
  }
}
