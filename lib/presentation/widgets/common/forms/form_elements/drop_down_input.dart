import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main/forms/form_elements/form_item_title.dart';


class DropDownInput extends StatefulWidget {
  double width;
  List<String> items;
  Function()? onChange;
  bool enable;
  String value;

  DropDownInput({required this.width, super.key, this.onChange, required this.value, required this.items, this.enable = true});

  @override
  State<DropDownInput> createState() => _DropDownInputState();
}

class _DropDownInputState extends State<DropDownInput> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        child: DropdownButton<String>(
          value: widget.value,
          items: getDropdownItems(widget.items, widget.width),
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          underline: const SizedBox(),
          padding: const EdgeInsets.all(4),
          onChanged: (value) {
            setState(() {
              widget.value = value!;
              if (widget.onChange != null) widget.onChange!();
            });
          },
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> getDropdownItems(List<String> items, double widthItem) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (String item in items) {
      menuItems.add(
        DropdownMenuItem(
          value: item,
          child: SizedBox(
            width: widthItem,
            child: FormItemTitle(
              title: item,
            ),
          ),
        ),
      );
    }
    return menuItems;
  }

  getValue() {

  }
}
