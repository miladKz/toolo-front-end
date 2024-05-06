import 'package:flutter/material.dart';

class FormItemTitle extends StatelessWidget {
  String title;
  TextStyle? style;
  double fontSize;
  Color textColor;
  FontWeight fontWeight;
  int maxLine;
  FormItemTitle({
    required this.title,
    this.fontSize = 12,
    this.maxLine = 1,
    this.textColor = const Color(0xFF5A5A5A),
    this.fontWeight = FontWeight.w600,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox
      (
      child: Text(
        title,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: style ??
            TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      ),
    );
  }

}
