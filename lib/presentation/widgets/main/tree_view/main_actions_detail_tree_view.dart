import 'package:flutter/material.dart';

import '../../../../domain/entities/accounting/account.dart';
import 'CustomExpansionTile.dart';
import 'tree_view_item.dart';

class MainActionsDetailTreeView extends StatefulWidget {
  double iconSize;
  double fontSize;
  Account item;

  MainActionsDetailTreeView(
      {Key? key, this.iconSize = 15, required this.item, this.fontSize = 12})
      : super(key: key);

  @override
  State<MainActionsDetailTreeView> createState() => _MainActionsDetailTreeViewState();
}

class _MainActionsDetailTreeViewState extends State<MainActionsDetailTreeView> {

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Text(
              widget.item.displayName,
              style: TextStyle(
                  fontSize: widget.fontSize,
                  color: const Color(0xFF616161),
                  fontWeight: FontWeight.bold),
            )
          ],
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
              children: widget.item.hasChildren
                  ? _buildChildren(widget.item.children, 1)
                  : [SizedBox()],
            )),
      ],
    );
  }

  List<Widget> _buildChildren(List<Account> items, double textScale) {
    return items.map((item) {
      return item.hasChildren
          ? MainActionsDetailTreeView(
              item: item,
              fontSize: widget.fontSize,
              iconSize: widget.iconSize,
            )
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(Account item, double textScale) {
    return TreeViewItem(
      account: item,
      title: item.displayName,
      fontSize: widget.fontSize,
      textScale: textScale,
      onTap: () {},
    );
  }
}
