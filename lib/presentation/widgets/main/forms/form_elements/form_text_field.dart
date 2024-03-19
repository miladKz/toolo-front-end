import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  String textHint;
  String errorText;
  bool enable;
  final double? widgetWidth;
  final double widgetHeight;
  TextEditingController? controller;
  TextInputType inputType;

  FormTextField(
      {
         this.widgetWidth,
         this.widgetHeight = 35,
      this.textHint = "",
      this.errorText = "",
      this.enable = true,
      this.inputType = TextInputType.text,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    //controller?.text = textHint;
    late TextInputFormatter inputFormatter;
    if (inputType == TextInputType.number) {
      inputFormatter = FilteringTextInputFormatter.digitsOnly;
    } else {
      inputFormatter = FilteringTextInputFormatter.singleLineFormatter;
    }
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        height: widgetHeight,
        width: widgetWidth,
        child: TextFormField(
          keyboardType: inputType,
          inputFormatters: [inputFormatter],
          enabled: enable,
          controller: controller,
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
