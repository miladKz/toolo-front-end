import 'package:flutter/cupertino.dart';

class FormItemTitle extends StatelessWidget {
  String title;
  double fontSize;
  FormItemTitle({
    required this.title,
     this.fontSize = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: const Color(0xFF5A5A5A),
          fontSize: fontSize,
          fontWeight: FontWeight.w600),
    );
  }
}