import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_button.dart';

class BtnSetFilter extends StatelessWidget{
  final double width;
  final Function() onTap;

  const BtnSetFilter({super.key, required this.width, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return FormButton(
      itemWidth: width,
      background: const Color(0xFF6C3483),
      textColor: Colors.white,
      title: localization.setFilter,
      onClick: () {
        onTap();
      },
    );
  }
}