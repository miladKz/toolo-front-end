import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_button.dart';

import '../../../../../main.dart';

class ModalActionButtons extends StatelessWidget {
  const ModalActionButtons({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.formWidth,
    required Function() onConfirm,
  })  : _formKey = formKey,
        _onConfirm = onConfirm;

  final double formWidth;
  final Function() _onConfirm;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FormButton(
          itemWidth: (formWidth / 2) - 25,
          background: const Color(0xFF6C3483),
          textColor: Colors.white,
          title: localization.captionSuccess,
          onClick: () {
           // if (_formKey.currentState != null &&
               // _formKey.currentState!.validate()) {
              _onConfirm();
            //}
          },
        ),
        FormButton(
            itemWidth: (formWidth / 2) - 25,
            background: const Color(0xFFD9BCE4),
            textColor: const Color(0xFF6C3483),
            title: localization.captionCancel,
            onClick: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
