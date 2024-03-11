import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/work_space_detail_menu/workspace_detail_menu_item.dart';

import '../../../../domain/entities/accounting/accounting_action.dart';

class MainActionsTree extends StatefulWidget {
  final AccountingAction item;
  final bool isRoot;
  bool isExpanded = false;
  double titleFontSize;
  double iconSize;
  late double widthScreen;

  MainActionsTree(
      {Key? key,
      required this.item,
      required this.isRoot,
      this.titleFontSize = 12,
      this.iconSize = 15})
      : super(key: key);

  @override
  State<MainActionsTree> createState() => _MainActionsTreeState();
}

class _MainActionsTreeState extends State<MainActionsTree> {
  EdgeInsets groupMargin = const EdgeInsets.only(right: 15);
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    widget.widthScreen = MediaQuery.sizeOf(context).width * 0.9;
    double textScale = widget.widthScreen ;
    return ExpansionTile(
      onExpansionChanged: (isExpanded) =>
          setState(() => _isExpanded = isExpanded),
      trailing: SizedBox(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _isExpanded
                    ? Icon(Icons.remove,
                        size: widget.iconSize, color: Color(0xFF6C3483))
                    : Icon(Icons.add,
                        size: widget.iconSize, color: Color(0xFFBD8AD0)),
                const SizedBox(width: 5),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.item.description,
                  textScaler: TextScaler.linear(
                      widget.widthScreen < 200 ? textScale : 1),
                  style: TextStyle(
                    fontSize: widget.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: _isExpanded ? Color(0xFF6C3483) : Color(0xFF7B7B84),
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
      return item.hasChildren
          ? Container(
              margin: groupMargin,
              child: MainActionsTree(
                item: item,
                isRoot: false,
                titleFontSize: widget.titleFontSize - 0.5,
                iconSize: widget.iconSize,
              ))
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(AccountingAction item, double textScale) {
    return WorkspaceDetailMenuItem(
      item: item,
      fontSize: widget.titleFontSize,
      textScale: textScale,
      onTap:() {},
    );
  }
}
