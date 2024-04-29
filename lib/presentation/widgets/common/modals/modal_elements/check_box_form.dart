import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';

class FormCheckBox extends StatefulWidget {
  Function(bool)? onChange;
  bool enable;
  bool value;
  String title;

  FormCheckBox({
    super.key,
    this.onChange,
    required this.value,
    required this.title,
    this.enable = true,
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
              value: widget.value,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xff479F76);
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
            FormItemTitle(
              title: widget.title,
            )
          ],
        ),
      ),
    );
  }

  getValue() {}
}
