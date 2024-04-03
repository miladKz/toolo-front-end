import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/account_document_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/bank_branch_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_data_table_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/card_reader_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/floating_detail_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/group_relationship_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/group_relationship_modal_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/manage_pepole_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/revolving_fund_main_toolbar_action_items.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import 'expandable_menu.dart';
import 'toolbar_items/account_toolbar_action_items.dart';

Widget myCustomToolbar(
    {required ToolBarEnum toolBarEnum, bool isActionShow = false}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          late  List<Widget> toolbarActionItems;

          switch (toolBarEnum) {
            case ToolBarEnum.accountMainToolbar:
              {
                toolbarActionItems = accountToolbarActionsItem(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.groupRelationshipManagementMainToolbar:
              {
                toolbarActionItems = groupRelationshipMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.groupRelationshipManagementModalToolbar:
              {
                toolbarActionItems = groupRelationshipModalToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.baseDataTableToolbar:
              {
                toolbarActionItems = baseDataTableToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.floatingDetailManagementModalToolbar:
              {
                toolbarActionItems = floatingDetailMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.peopleManagementModalToolbar:
              {
                toolbarActionItems = managePeopleMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.bankBranchManagementModalToolbar:
              {
                toolbarActionItems = managementBankBranchMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.revolvingFundManagementModalToolbar:
              {
                toolbarActionItems = revolvingFundMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }
            case ToolBarEnum.cardReaderManagementModalToolbar:
              {
                toolbarActionItems = cardReaderMainToolbarActionItems(
                    context: context, maxWidth: maxWidth);
                break;
              }case ToolBarEnum.accountDocumentMainToolbar:
              {
                toolbarActionItems = accountDocumentMainToolbarActionItems(
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
            isActionShow: isActionShow,
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
    this.isActionShow = false,
  });

  final double maxWidth;
  bool isActionShow;

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
