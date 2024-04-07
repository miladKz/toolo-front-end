import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/accounting/accounting_action.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import 'action_tree_view.dart';

int actionsSubTitleSelected = -1;
List<int> actionsTitlesSelected = List.empty(growable: true);

class ActionsTreeViewBuilder extends StatelessWidget {
  double width;

  ActionsTreeViewBuilder({
    required this.width,
    super.key,
  }) {
    actionsSubTitleSelected = -1;
  }

  List<AccountingAction> items = List.empty();

  @override
  Widget build(BuildContext context) {
    updateList(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(11)),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return items.isNotEmpty
                ? ActionTreeView(
                    item: items[0],
                    isRoot: true,
                    width: width,
                    isExpanded: true,
                  )
                : const SizedBox();
          },
        ));
  }

  updateList(BuildContext context) {
    final bloc = context.watch<MainBloc>();
    if (bloc.filteredActions.isNotEmpty) {
      items = bloc.filteredActions;
    }
  }
}
