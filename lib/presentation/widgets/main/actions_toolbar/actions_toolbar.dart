import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import 'base_toolbar_action_items.dart';
import 'expandable_menu.dart';

class ActionsToolbar extends StatefulWidget {
  ActionsToolbar({
    super.key,
    required this.maxWidth,
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
            items: baseToolbarActionsItem(context, widget.maxWidth),
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
