import 'package:flutter/material.dart';

class CollapsibleContainer extends StatelessWidget {
  const CollapsibleContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.padding,
      required this.color,
      required this.child});

  final double height, width, padding;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
