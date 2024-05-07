import 'package:flutter/material.dart';

class CollapsibleItemWidget extends StatefulWidget {
  const CollapsibleItemWidget({
    required this.onHoverPointer,
    required this.leading,
    required this.item,
    required this.padding,
    required this.offsetX,
    required this.scale,
    this.isCollapsed,
    this.isSelected,
    this.minWidth,
    this.onTap,
    this.onLongPress,
    this.iconSize,
    this.iconColor,
    this.parentComponent,
  });

  final MouseCursor onHoverPointer;
  final Widget leading;
  final Widget item;
  final double offsetX, scale, padding;
  final bool? isCollapsed;
  final bool? isSelected;
  final double? minWidth;
  final VoidCallback? onTap;
  final double? iconSize;
  final Color? iconColor;
  final bool? parentComponent;
  final VoidCallback? onLongPress;

  @override
  _CollapsibleItemWidgetState createState() => _CollapsibleItemWidgetState();
}

class _CollapsibleItemWidgetState extends State<CollapsibleItemWidget> {
  bool _underline = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _underline = true && widget.onTap != null;
        });
      },
      onExit: (event) {
        setState(() {
          _underline = false;
        });
      },
      cursor: widget.onHoverPointer,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(widget.padding),
            child: GestureDetector(
              onTap: widget.onTap,
              onLongPress: widget.onLongPress,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _title,
                ],
              ),
            ));
      }),
    );
  }

  Widget get _title {
    return Flexible(
      child: Opacity(
        opacity: widget.scale,
        child: Transform.translate(
          offset: Offset(
            Directionality.of(context) == TextDirection.ltr
                ? widget.offsetX
                : 0,
            0,
          ),
          child: Transform.scale(
            scale: widget.scale,
            child: widget.item,
          ),
        ),
      ),
    );
  }
}
