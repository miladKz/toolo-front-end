import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/constants/color_constants.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_tree_view/action_tree_view_builder.dart';

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

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double textScale = widget.width * 0.004;

    return ExpansionTile(
      onExpansionChanged: (isExpanded) =>
          setState(() => widget.isExpanded = isExpanded),
      trailing: const SizedBox(),
      title: MouseRegion(
          onEnter: (event) {
            bool isAdded = actionsTitlesSelected.contains(widget.item.id);
            if (!isAdded) {
              setState(() {
                actionsTitlesSelected.add(widget.item.id);
              });
            }
          },
          onExit: (event) => setState(() => _isHovered = false),
          onHover: (event) => setState(() => _isHovered = true),
          child: getTitle(textScale)),
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

  Row getTitle(double textScale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.isExpanded
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
                  color: getTitleColor(
                    isSelected: actionsTitlesSelected.contains(widget.item.id),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChildren(List<AccountingAction> items, double textScale) {
    return items.map((item) {
      return item.hasChildren
          ? _buildSubTreeView(item)
          : _buildItem(item, textScale);
    }).toList();
  }

  Container _buildSubTreeView(AccountingAction item) {
    return Container(
            margin: groupMargin,
            child: ActionTreeView(
              width: widget.width,
              item: item,
              isRoot: false,
              titleFontSize: widget.titleFontSize - 0.5,
              iconSize: widget.iconSize,
            ));
  }

  Widget _buildItem(AccountingAction item, double textScale) {
    return ActionsTreeViewItem(
      item: item,
      isSelected: actionsSubTitleSelected == item.id,
      fontSize: widget.titleFontSize,
      textScale: textScale,
      onTap: () {
        actionsSubTitleSelected = item.id;
      },
    );
  }

  Color getTitleColor({required bool isSelected}) {
    if (_isHovered) {
      return ColorConstants.colorActionTreeHover;
    } else if (widget.isExpanded) {
      return ColorConstants.colorActionSelected;
    } else if (isSelected) {
      return ColorConstants.colorActionSelected;
    } else {
      return ColorConstants.colorActionUnSelected;
    }
    //_isExpanded ? const Color(0xFF6C3483) : const Color(0xFF7B7B84);
  }
}
