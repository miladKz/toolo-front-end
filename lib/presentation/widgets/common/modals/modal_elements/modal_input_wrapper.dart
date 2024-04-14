
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';


class ModalInputWrapper extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final double inputWidth;
  final bool centeredInput;

  const ModalInputWrapper({
    Key? key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.enabled = true,
    required this.inputWidth,
    this.suffixIcon,
    this.onChanged,
    this.centeredInput = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormItemTitle(
            title: title,
            textColor: const Color(0xFF616161),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 30,
            width: inputWidth,
            child: TextFormField(
              maxLines: 1,
              enabled: enabled,
              controller: controller,
              style: const TextStyle(fontSize: 12, color: Color(0xFF989B9F)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
                hintText: hintText,
                suffixIcon: suffixIcon != null
                    ? Icon(
                  suffixIcon,
                  size: 23,
                  color: const Color(0xFF6C3483),
                )
                    : null,
                hintStyle: const TextStyle(
                  color: Color(0xFF6C6F72),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}