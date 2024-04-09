import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_tree_view/action_tree_view_item.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu_item.dart';

import '../../../domain/entities/accounting/accounting_action.dart';
import '../../../gen/assets.gen.dart';
import '../../blocs/main_bloc/main_bloc.dart';

class ActionPinnedMenu extends StatefulWidget {
  AccountingAction? selectedItem;

  ActionPinnedMenu({
    super.key,
  });

  @override
  State<ActionPinnedMenu> createState() => _ActionPinnedMenuState();
}

class _ActionPinnedMenuState extends State<ActionPinnedMenu> {
  bool _isExpanded = false;
  final double borderRadius = 11;
  List<AccountingAction> children = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    updateList();
    AppLocalizations localization = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          border: _isExpanded
              ? null
              : Border.all(
              color: const Color(0xFF929292).withOpacity(0.25), width: 1),
          color: _isExpanded ? const Color(0xFFF6F6F6) : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ExpansionTile(
          onExpansionChanged: (isExpanded) =>
              setState(() => _isExpanded = isExpanded),
          shape: const Border(),
          collapsedIconColor: const Color(0xFFBD8AD0),
          tilePadding:
              const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _isExpanded
                        ?  Assets.ico.icPinSelected.image(width: 20, height: 20)
                        :  Assets.ico.icPinNotSelected.image(width: 20, height: 20),

                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      localization.titlePinsMenu,
                      style: const TextStyle(
                          color: Color(0xFF7B7B84),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          children: [
           const Padding(
              padding: EdgeInsets.only(bottom: 5, right: 15, left: 15),
              child: Divider(
                height: 2,
                color: Color(0xFFEFEFF4),
              ),
            ),
            BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return Column(
                  children: children.map((action) {
                    return WorkspaceMenuItem(
                      isSelected: widget.selectedItem == action,
                      title: action.description,
                      onTap: () {
                        setSelectedItem(action);
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateList() {
    final state = context.watch<MainBloc>().state;
    if (state is MainAddPinnedActionSuccess && !children.contains(state.action)) {
      children.add(state.action);
    }else if(state is MainRemovePinnedActionSuccess && children.contains(state.action)){
      children.remove(state.action);
    }
  }

  void setSelectedItem(AccountingAction item) {
    return setState(() {
      widget.selectedItem = item;
      item.endPoint.isEmpty?callApiByEndpoint(item.description): callApiByEndpoint(item.endPoint);
    });
  }


}

class GetAccountingActionIntent extends Intent {
  const GetAccountingActionIntent();
}


