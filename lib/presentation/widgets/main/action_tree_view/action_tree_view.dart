import 'package:flutter/material.dart';

import '../../../../domain/entities/accounting/accounting_action.dart';
import 'action_tree_view_item.dart';

class ActionTreeView extends StatefulWidget {
  final AccountingAction item;
  final bool isRoot;
  bool isExpanded = false;
  double titleFontSize;
  double iconSize;
  double width;

  ActionTreeView(
      {Key? key,
      required this.item,
      required this.isRoot,
      required this.width,
      this.titleFontSize = 13,
      this.iconSize = 15})
      : super(key: key);

  @override
  State<ActionTreeView> createState() => _ActionTreeViewState();
}

class _ActionTreeViewState extends State<ActionTreeView> {
  EdgeInsets groupMargin = const EdgeInsets.only(right: 15);
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double textScale = widget.width * 0.004;
    return ExpansionTile(
      onExpansionChanged: (isExpanded) =>
          setState(() => _isExpanded = isExpanded),
      trailing: const SizedBox(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _isExpanded
                    ? Icon(Icons.remove,
                        size: widget.iconSize, color: const Color(0xFF6C3483))
                    : Icon(Icons.add,
                        size: widget.iconSize, color: const Color(0xFFBD8AD0)),
                const SizedBox(width: 5),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.item.description,
                  textScaler:
                      TextScaler.linear(widget.width < 300 ? textScale : 1),
                  style: TextStyle(
                    fontSize: widget.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: _isExpanded
                        ? const Color(0xFF6C3483)
                        : const Color(0xFF7B7B84),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      children: widget.item.hasChildren
          ? widget.isRoot
              ? [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Divider(
                      height: 2,
                      color: Color(0xFFEFEFF4),
                    ),
                  ),
                  ..._buildChildren(widget.item.children, textScale)
                ]
              : _buildChildren(widget.item.children, textScale)
          : [const SizedBox()],
    );
  }

  List<Widget> _buildChildren(List<AccountingAction> items, double textScale) {
    return items.map((item) {
      print("SSSSSSSSSSSSSSSSSSSSS " + widget.titleFontSize.toString());
      return item.hasChildren
          ? Container(
              margin: groupMargin,
              child: ActionTreeView(
                width: widget.width,
                item: item,
                isRoot: false,
                titleFontSize: widget.titleFontSize - 0.5,
                iconSize: widget.iconSize,
              ))
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(AccountingAction item, double textScale) {
    return ActionsTreeViewItem(
      item: item,
      fontSize: widget.titleFontSize,
      textScale: textScale,
      onTap: () {},
    );
  }
}
