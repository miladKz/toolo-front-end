import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';

class RadioButtonForm extends StatefulWidget {
  Function(int value) onChanged;
  bool enable;
  int index;
  String title;
  int selectedRadio;

  RadioButtonForm({
    super.key,
    required this.onChanged,
    required this.index,
    required this.title,
    required this.selectedRadio,
    this.enable = true,
  });

  @override
  State<RadioButtonForm> createState() => _RadioButtonFormState();
}

class _RadioButtonFormState extends State<RadioButtonForm> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: SizedBox(
        height: 5,
        child: RadioListTile(
          title: FormItemTitle(
            title: widget.title,
          ),
          value: widget.index,
          groupValue: widget.selectedRadio,
          onChanged: (int? value) {
            widget.onChanged(value!);
          },

              ),
      )
    );
  }
}
