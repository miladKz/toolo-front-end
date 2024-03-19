import 'package:flutter/cupertino.dart';

class FormItemTitle extends StatelessWidget {
  String title;
  double fontSize;
  Color textColor;
  FontWeight fontWeight;

  FormItemTitle({
    required this.title,
    this.fontSize = 12,
    this.textColor = const Color(0xFF5A5A5A),
    this.fontWeight = FontWeight.w600,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
