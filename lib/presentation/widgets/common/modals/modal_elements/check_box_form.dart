import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';

class FormCheckBox extends StatefulWidget {
  Function(bool)? onChange;
  bool enable;
  bool value;
  String title;
  Color borderColor;
  FormCheckBox({
    super.key,
    this.onChange,
    required this.value,
    required this.title,
    this.enable = true,
    this.borderColor = const Color(0xFFDEE2E6)
  });

  @override
  State<FormCheckBox> createState() => _FormCheckBoxState();
}

class _FormCheckBoxState extends State<FormCheckBox> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: SizedBox(
        height: 35,
        child: Row(
          children: [
            Checkbox(
              shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)),
              side: BorderSide(
                color: widget.borderColor,
                width: 1.0,
              ),
              value: widget.value,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFF6FC469);
                }
                return null;
              }),
              onChanged: (value) {
                widget.value = !widget.value;
                setState(() {
                  if (widget.onChange != null && value != null) {
                    widget.onChange!(value);
                  }
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: FormItemTitle(
                title: widget.title,
                maxLine: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  getValue() {}
}
