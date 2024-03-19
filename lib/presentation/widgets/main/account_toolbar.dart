import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/main_bloc/main_bloc.dart';
import 'expandable_menu/accounting_action_items.dart';
import 'expandable_menu/expandable_menu.dart';

class AccountToolbar extends StatefulWidget {
  AccountToolbar({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;
  bool isActionShow = false;

  @override
  State<AccountToolbar> createState() => _AccountToolbarState();
}

class _AccountToolbarState extends State<AccountToolbar> {
  @override
  Widget build(BuildContext context) {
    updateState();
    return widget.isActionShow
        ? CustomExpandableMenu(
      maxSpaceWidth: widget.maxWidth,
      height: 40,
      items: accountingActionsItem(context, widget.maxWidth),
    )
        :  SizedBox(
      width: widget.maxWidth,
      height: 40,
    ).inVisible(boxWidth: widget.maxWidth,boxHeight: 40,visibility: false);
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