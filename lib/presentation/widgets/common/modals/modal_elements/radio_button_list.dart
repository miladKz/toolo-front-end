
import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/radio_button_form.dart';
class CustomGridRadioButtonList extends StatefulWidget {
  final double width;
  final double height;
  final List<String> radioButtonTitle;
  final TextEditingController controller;
  int selectedRadio = 0;

  CustomGridRadioButtonList({super.key, required this.width, required this.height, required this.radioButtonTitle, required this.controller});

  @override
  State<CustomGridRadioButtonList> createState() => _CustomGridRadioButtonListState();
}

class _CustomGridRadioButtonListState extends State<CustomGridRadioButtonList> {
  @override
  Widget build(BuildContext context) {

    double maxWidth = widget.width;
    widget.controller.value=TextEditingValue(text: widget.selectedRadio.toString());
    return SizedBox(
      width: maxWidth,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 4,
          childAspectRatio: (widget.width / widget.height) ,
        ),
        itemCount: widget.radioButtonTitle.length,
        itemBuilder: (context, index) {
          return RadioButtonForm(
            title: widget.radioButtonTitle[index],
            index: index,
            selectedRadio: widget.selectedRadio,
            onChanged: (int value) {
              setState(() {
                widget.selectedRadio = value;
              });
            },
          );
        },
      ),
    );
  }
}