import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollapsibleItem {
  CollapsibleItem(
      {required this.content,
      this.iconImage,
      this.onPressed,
      this.isSelected = false});

  final Widget content;
  Image? iconImage;
  Function? onPressed;
  bool isSelected;
}
