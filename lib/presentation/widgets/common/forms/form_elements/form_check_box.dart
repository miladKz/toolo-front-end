import 'dart:html';

import 'package:flutter/material.dart';

import '../../../main/forms/form_elements/form_item_title.dart';

class FormCheckBox extends StatefulWidget {
  Function()? onChange;
  bool enable;
  bool value;
  String title;

  FormCheckBox(
      {
        super.key,
        this.onChange,
        required this.value,
        required this.title,
        this.enable = true,});

  @override
  State<FormCheckBox> createState() => _FormCheckBoxState();
}

class _FormCheckBoxState extends State<FormCheckBox> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: Container(
        height: 35,
        child: Row(children: [
          Checkbox(value: widget.value, onChanged: (value) {
            if(widget.onChange != null){
              setState(() {
                widget.onChange!();
              });
            }

            },),
          SizedBox(width: 5,),
          FormItemTitle(title: widget.title,)
        ],),
      ),
    );
  }


  getValue() {}
}
