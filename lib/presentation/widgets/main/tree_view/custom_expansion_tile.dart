import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  Function() onTap;

   CustomExpansionTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              widget.onTap();
              _toggleExpansion();
            },
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  _isExpanded
                      ? Icon(Icons.remove,
                      size: 12, color: const Color(0xFF6C3483))
                      : Icon(Icons.add,
                      size: 12, color: const Color(0xFFBD8AD0)),
                  const SizedBox(width: 5),
                  widget.title,
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _isExpanded ? 1.0 : 0.0,
            child: SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _animation,
              child: Container(
                child: Column(
                  children: widget.children
                      .map((child) => child)
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}