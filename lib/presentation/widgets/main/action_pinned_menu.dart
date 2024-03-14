import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../../domain/entities/accounting/accounting_action.dart';
import '../../../gen/assets.gen.dart';
import '../../blocs/main_bloc/main_bloc.dart';
import 'workspace_menu_item.dart';

class PinnedWorkspace extends StatefulWidget {
  WorkSpaceItems selectedItem;
  PinnedWorkspace({
    this.selectedItem = WorkSpaceItems.accounting,
    super.key,
  });
  @override
  State<PinnedWorkspace> createState() => _PinnedWorkspaceState();
}

class _PinnedWorkspaceState extends State<PinnedWorkspace> {
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
          color: const Color(0xFFF6F6F6),
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
                        ? Assets.ico.icCartableSelected
                        .image(width: 20, height: 20)
                        : Assets.ico.icCartableNotSelected
                        .image(width: 20, height: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      localization.titlePinsMenu,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B7B84)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Assets.ico.icPinNotSelected.image(width: 15, height: 15),
              )
            ],
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, right: 15, left: 15),
              child: Divider(
                height: 2,
                color: Color(0xFFEFEFF4),
              ),
            ),
            BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {

                return Column(
                 // children: widget.children,
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
    if (state is AddPinnedActionState) {
      children.add(state.action);
      print(state.action.description);
    }
  }
  void setSelectedItem(WorkSpaceItems item) {
    return setState(() {
      widget.selectedItem  = item;
      getItemActions();
    });
  }

  getItemActions() {
    locator.get<MainBloc>().add(FilterActionsEvent(widget.selectedItem));
  }
}

class GetAccountingActionIntent extends Intent {
  const GetAccountingActionIntent();
}

