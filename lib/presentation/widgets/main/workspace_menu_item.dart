import 'package:flutter/widgets.dart';

class WorkspaceMenuItem extends StatefulWidget {
  bool isSelected;
  final String title;
  final double? width;
  final double? height;
  final Function() onTap;

  WorkspaceMenuItem({
    required this.isSelected,
    required this.title,
    this.width,
    this.height,
    required this.onTap,
    super.key,
  });

  @override
  State<WorkspaceMenuItem> createState() => _WorkspaceMenuItemState();
}

class _WorkspaceMenuItemState extends State<WorkspaceMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovered = true),
        onExit: (event) => setState(() => _isHovered = false),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
          constraints: BoxConstraints(
            maxHeight: widget.height ?? 50,
          ),
          decoration: BoxDecoration(
            color: setItemBackground(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.title,
              style: TextStyle(
                color: setItemTextColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color setItemTextColor() =>
      _isHovered|| widget.isSelected? Color(0xFFFFFFFF) : Color(0xFF83838B);

  Color setItemBackground() => widget.isSelected
      ? ((_isHovered ? Color(0xFFE8AEFC) : Color(0xFFBD8AD0)))
      : (_isHovered ? Color(0xFFE8AEFC) : Color(0xFFFFFFFF));
}
