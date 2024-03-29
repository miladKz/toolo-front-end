import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/group_relationship_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/group_relationship_modal_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import 'account_toolbar_action_items.dart';
import 'expandable_menu.dart';

Widget MyCustomToolbar({required ToolBarEnum toolBarEnum}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          late final List<Widget> toolbarActionItems;

          switch (toolBarEnum) {
            case ToolBarEnum.accountMainToolbar:
              {
                toolbarActionItems = accountToolbarActionsItem(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.groupRelationshipManagementMainToolbar:
              {
                toolbarActionItems = groupRelationshipMainToolbarActionsItem(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.groupRelationshipManagementModalToolbar:
              {
                toolbarActionItems = groupRelationshipModalToolbarActionsItem(
                    context: context, maxWidth: maxWidth);
                break;
              }
            default:
              {
                toolbarActionItems = List.empty();
                break;
              }
          }

          return ActionsToolbar(
            maxWidth: maxWidth,
            toolbarActionItems: toolbarActionItems,
          );
        },
      ),
    ),
  );
}

class ActionsToolbar extends StatefulWidget {
  final List<Widget> toolbarActionItems;
  ActionsToolbar({
    super.key,
    required this.maxWidth,
    required this.toolbarActionItems,
  });

  final double maxWidth;
  bool isActionShow = false;

  @override
  State<ActionsToolbar> createState() => _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar> {
  @override
  Widget build(BuildContext context) {
    updateState();
    return widget.isActionShow
        ? ExpandableMenu(
            maxSpaceWidth: widget.maxWidth,
            height: 40,
            items: widget.toolbarActionItems,
          )
        : SizedBox(
            width: widget.maxWidth,
            height: 40,
          ).inVisible(
            boxWidth: widget.maxWidth, boxHeight: 40, visibility: false);
  }

  void updateState() {
    final state = context.watch<MainBloc>().state;
    if (state is MainActionToolbarVisibility) {
      setState(() {
        widget.isActionShow = state.isShow;
      });
    }
  }
}
