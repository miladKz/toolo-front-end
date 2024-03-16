import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../main/forms/form_elements/form_button.dart';
import '../../main/forms/form_elements/form_item_title.dart';
import '../../main/forms/form_elements/form_text_field.dart';
import 'form_elements/drop_down_input.dart';
import 'form_elements/multiline_text_input.dart';

class FloatingDetailForm extends StatelessWidget {
   FloatingDetailForm({
    super.key,
    required this.formWidth,
     this.isActive = true,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;

   final Widget verticalGapDivider = const SizedBox(
    height: 10,
  );
   final Widget titleInputSpacing = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.code),
        titleInputSpacing,
        FormTextField(
          enable: isActive,
          textHint: localization.automaticSelection,
        ),
        verticalGapDivider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormItemTitle(
                  title: localization.status,
                ),
                titleInputSpacing,
                DropDownInput(
                  enable: isActive,
                  width: (formWidth / 2) - 60,
                  value: localization.active,
                  items: [localization.active, localization.deactivate],
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormItemTitle(title: localization.detailedCode),
                titleInputSpacing,
                DropDownInput(
                  enable: isActive,
                  width: (formWidth / 2) - 60,
                  value: 'نیمه ها',
                  items: ['نیمه ها'],
                )
              ],
            )
          ],
        ),
        verticalGapDivider,
        FormItemTitle(title: localization.name),
        titleInputSpacing,
        FormTextField(
          enable: isActive
        ),
        verticalGapDivider,
        FormItemTitle(title: localization.description),
        titleInputSpacing,
        MultilineTextInput(enable: isActive),
        verticalGapDivider,
        FormItemTitle(
          title: localization.type,
        ),
        titleInputSpacing,
        DropDownInput(
          enable: isActive,
          width: formWidth - 74,
          value: localization.active,
          items: [localization.active, localization.deactivate],
        ),
       const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormButton(
              itemWidth: (formWidth / 2) - 25,
              background: const Color(0xFF6C3483),
              textColor: Colors.white,
              title: localization.captionSuccess,
              onClick: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {}
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
        )
      ],
    );
  }
}
