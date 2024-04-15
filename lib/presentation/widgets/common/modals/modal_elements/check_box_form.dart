import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';


class CheckBoxForm extends StatefulWidget {
  Function()? onChange;
  bool enable;
  bool value;
  String title;

  CheckBoxForm(
      {
        super.key,
        this.onChange,
        required this.value,
        required this.title,
        this.enable = true,});

  @override
  State<CheckBoxForm> createState() => _CheckBoxFormState();
}

class _CheckBoxFormState extends State<CheckBoxForm> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: SizedBox(
        height: 35,
        child: Row(children: [
          Checkbox(value: widget.value,
            fillColor:MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xff479F76);
              }
              return null;
            }),
            onChanged: (value) {
                setState(() {
                  widget.value = !widget.value;
                  if (widget.onChange != null) {
                    widget.onChange!();
                  }
                });
              },),
            /*const SizedBox(
              width: 5,
            ),*/
            FormItemTitle(title: widget.title,)
        ],),
      ),
    );
  }


}
