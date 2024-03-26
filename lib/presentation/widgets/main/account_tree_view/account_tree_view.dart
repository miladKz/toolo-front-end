import 'package:flutter/material.dart';
import 'package:toolo_gostar/di/di.dart';

import '../../../../domain/entities/accounting/account.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../edit_group_dialog.dart';
import '../../common/widget_tree/custom_expansion_tile.dart';
import 'account_tree_view_item.dart';

class AccountTreeView extends StatefulWidget {
  double iconSize;
  double fontSize;
  Account account;

  AccountTreeView(
      {Key? key, this.iconSize = 15, required this.account, this.fontSize = 12})
      : super(key: key);

  @override
  State<AccountTreeView> createState() => _AccountTreeViewState();
}

class _AccountTreeViewState extends State<AccountTreeView> {

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      onTap: () {
        selectItem();
      },
      title: GestureDetector(
        onDoubleTap: () {
          selectItem();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return EditGroupDialog(
                  account: widget.account,); // Pass your account data here
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Text(
                widget.account.displayName,
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: const Color(0xFF616161),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      children: [
        Container(
            margin: const EdgeInsets.only(right: 2),
            padding: const EdgeInsets.only(right: 5),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xFFDFE3E7),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: widget.account.hasChildren
                  ? _buildChildren(widget.account.children, 1)
                  : [const SizedBox()],
            )),
      ],
    );
  }

  void selectItem() {
    locator.get<MainBloc>().add(OnClickOnAccount(widget.account));
  }

  List<Widget> _buildChildren(List<Account> items, double textScale) {
    return items.map((item) {
      return item.hasChildren
          ? AccountTreeView(
              account: item,
              fontSize: widget.fontSize,
              iconSize: widget.iconSize,
            )
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(Account item, double textScale) {
    return AccountTreeViewItem(
      account: item,
      title: item.displayName,
      fontSize: widget.fontSize,
      textScale: textScale,
      onTap: () {},
    );
  }
}
