import 'package:flutter/material.dart';

import '../../../../domain/entities/accounting/account.dart';
import 'tree_view_item.dart';

class TreeView extends StatefulWidget {
  double iconSize;
  double fontSize;
  Account item;
  EdgeInsets groupMargin = const EdgeInsets.only(right: 15);

  TreeView(
      {Key? key, this.iconSize = 15, required this.item, this.fontSize = 14})
      : super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (isExpanded) =>
          setState(() => _isExpanded = isExpanded),
      trailing: const SizedBox(),
      title: Flexible(
          child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
            color:const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            _isExpanded
                ? Icon(Icons.remove,
                    size: widget.iconSize, color: const Color(0xFF6C3483))
                : Icon(Icons.add,
                    size: widget.iconSize, color: const Color(0xFFBD8AD0)),
            const SizedBox(width: 5),
            Text(
              widget.item.displayName,
              style: TextStyle(
                  fontSize: widget.fontSize,
                  color: const Color(0xFF616161),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
      children: [
        Container(
            margin: const EdgeInsets.only(right: 20, left: 55),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xFFDFE3E7),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: widget.item.hasChildren? _buildChildren(widget.item.children, 1):[SizedBox()],
            )),
      ],
    );
  }

  List<Widget> _buildChildren(List<Account> items, double textScale) {
    return items.map((item) {
      return item.hasChildren
          ? Container(
              margin: widget.groupMargin,
              child: TreeView(
                item: item,
                iconSize: widget.iconSize,
              ))
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(Account item, double textScale) {
    return TreeViewItem(
      title: item.displayName,
      fontSize: widget.fontSize,
      textScale: textScale,
      onTap: () {},
    );
  }
}
