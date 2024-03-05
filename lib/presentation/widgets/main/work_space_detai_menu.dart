import 'package:flutter/material.dart';

import '../../../domain/entities/main/work_space_detal_item.dart';
import '../../../gen/assets.gen.dart';

class WorkSpaceDetailMenu extends StatefulWidget {
  final WorkspaceDetailItem item;
  final bool isRoot;
  double titleFontSize = 17;
  double iconSize = 17;
  late double widthScreen;
  WorkSpaceDetailMenu(
      {Key? key,
      required this.item,
      required this.isRoot,
      this.titleFontSize = 17,
      this.iconSize = 17})
      : super(key: key);

  @override
  State<WorkSpaceDetailMenu> createState() => _WorkSpaceDetailMenuState();
}

class _WorkSpaceDetailMenuState extends State<WorkSpaceDetailMenu> {
  EdgeInsets childMargin = const EdgeInsets.only(right: 20);
  EdgeInsets groupMargin = const EdgeInsets.only(right: 15);
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double mockupWidth = 247;
    widget.widthScreen = MediaQuery.sizeOf(context).width * 0.2;
    double textScale =  widget.widthScreen / mockupWidth;
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
                  widget.item.title,
                  textScaler:
                      TextScaler.linear( widget.widthScreen < 200 ? textScale : 1),
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

  List<Widget> _buildChildren(
      List<WorkspaceDetailItem> items, double textScale) {
    return items.map((item) {
      return item.hasChildren
          ? Container(
              margin: groupMargin,
              child: WorkSpaceDetailMenu(
                item: item,
                isRoot: false,
                titleFontSize: widget.titleFontSize -0.5,
                iconSize: widget.iconSize,
              ))
          : _buildItem(item, textScale);
    }).toList();
  }

  Widget _buildItem(WorkspaceDetailItem item, double textScale) {
    if (item.hasChildren) {
      return ExpansionTile(
        onExpansionChanged: (isExpanded) =>
            setState(() => item.isExpanded = isExpanded),
        trailing: const SizedBox(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  item.isExpanded
                      ? const Icon(Icons.remove,
                          size: 20, color: Color(0xFF6C3483))
                      : const Icon(Icons.add,
                          size: 20, color: Color(0xFFBD8AD0)),
                  const SizedBox(width: 5),
                  Text(
                    item.title,
                    textScaler: TextScaler.linear( widget.widthScreen < 200 ? textScale : 1),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: item.isExpanded
                          ? const Color(0xFF6C3483)
                          : const Color(0xFF7B7B84),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        children: _buildChildren(item.children, textScale),
      );
    } else {
      return GestureDetector(
        onTap: () {},
        child: MouseRegion(
          onEnter: (event) => setState(() => item.isHovered = true),
          onExit: (event) => setState(() => item.isHovered = false),
          child: Container(
            width: double.infinity,
            margin: childMargin,
            constraints: const BoxConstraints(maxHeight: 40),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Assets.ico.icPinSelected.image(
                      width: 13,
                      height: 13,
                      color: item.isHovered
                          ? Color(0xFF6C3483)
                          : Color(0xFFE7E7E7)),
                  const SizedBox(width: 5),
                  Text(
                    item.title,
                    textScaler: TextScaler.linear(widget.widthScreen < 200 ? textScale : 1),
                    style: TextStyle(
                        color: item.isHovered
                            ? const Color(0xFF6C3483)
                            : const Color(0xFF7B7B84),
                        fontWeight: FontWeight.normal,
                        fontSize: widget.titleFontSize - 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
