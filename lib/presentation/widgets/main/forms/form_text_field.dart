
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  String textHint;
  String errorText;

  FormTextField({
    this.textHint = "",
    this.errorText = "",
    super.key,
    required this.widgetWidth,
  });

  final double widgetWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        height: 35,
        width: widgetWidth - 7,
        child: TextFormField(
          onChanged: (value) {},
          style: TextStyle(fontSize: 12, color: Color(0xFF989B9F)),
          validator: (value) {
            if (value == "") {
              return errorText;
            }
          },
          decoration: InputDecoration(
              hintText: textHint,
              hintStyle: TextStyle(
                  color: Color(0xFF989B9F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.fromLTRB(5, 12, 12, 5)),
        ));
  }
}