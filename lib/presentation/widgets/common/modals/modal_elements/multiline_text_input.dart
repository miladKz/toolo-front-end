import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';

class MultilineTextInput extends StatelessWidget {
   MultilineTextInput({super.key, this.controller, this.height = 80, this.enable = true});
  TextEditingController? controller;
  double height;
  bool enable;
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 1, color: const Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        height: height,
        width: double.infinity,
        child: TextFormField(
          enabled: enable,
          controller: controller,
          maxLines: null,
          minLines: null,
          expands: true,
          onChanged: (value) {},
          style: const TextStyle(
              fontSize: 12, color: Color(0xFF989B9F)),
          validator: (value) {
            if (value == "") {
              return "error";
            }
          },
          decoration: InputDecoration(
              hintText: localization.textWritten,
              hintStyle: const TextStyle(
                  color: Color(0xFF989B9F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              contentPadding:
              const EdgeInsets.fromLTRB(10, -50, 10, 0)),
        ));
  }
}
