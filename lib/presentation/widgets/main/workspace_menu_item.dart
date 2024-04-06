import 'package:flutter/widgets.dart';
import 'package:toolo_gostar/presentation/constants/color_constants.dart';

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
            padding: const EdgeInsets.all(10),
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
  Color setItemTextColor() {
    return _isHovered|| widget.isSelected? const Color(0xFFFFFFFF) : const Color(0xFF83838B);
  }

  Color setItemBackground() {
    return widget.isSelected
      ? ((_isHovered ? const Color(0xFFE8AEFC) : const Color(0xFFBD8AD0)))
      : (_isHovered ? const Color(0xFFE8AEFC) : const Color(0xFFFFFFFF));
  }
}
