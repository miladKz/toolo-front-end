import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class GenericTreeViewItem<T extends IDataTreeModel> extends StatefulWidget {
  final double iconSize;
  final double fontSize;
  final IDataTreeModel model;
  final double textScale;
  final Function({required IDataTreeModel item, required bool isOnDouble})
      onCallBack;

  const GenericTreeViewItem(
      {super.key,
      required this.iconSize,
      required this.fontSize,
      required this.model,
      required this.textScale,
      required this.onCallBack});

  @override
  State<GenericTreeViewItem<T>> createState() =>
      _GenericTreeViewItemItemState<T>();
}

class _GenericTreeViewItemItemState<T extends IDataTreeModel>
    extends State<GenericTreeViewItem<T>> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width * 0.2;

    EdgeInsets childMargin =
        const EdgeInsets.only(right: 10, left: 1, top: 2, bottom: 2);
    return GestureDetector(
      onTap: () {
        widget.onCallBack(isOnDouble: false, item: widget.model);
      },
      onDoubleTap: () {
        widget.onCallBack(isOnDouble: false, item: widget.model);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) => setState(() => _isHovered = false),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _isHovered ? const Color(0xFFEFE0F5) : Colors.white),
          width: double.maxFinite,
          margin: childMargin,
          constraints: const BoxConstraints(maxHeight: 30),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 1, left: 10, bottom: 4, top: 4),
            child: Text(
              widget.model.displayName,
              textScaler:
                  TextScaler.linear(widthScreen < 200 ? widget.textScale : 1),
              style: TextStyle(
                  color: _isHovered
                      ? const Color(0xFF6C3483)
                      : const Color(0xFF7B7B84),
                  fontWeight: FontWeight.normal,
                  fontSize: widget.fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
