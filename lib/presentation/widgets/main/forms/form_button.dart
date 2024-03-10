import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  FormButton({
    super.key,
    required this.itemWidth,
    required this.title,
    required this.background,
    required this.textColor,
    required this.onClick,
  });

  final double itemWidth;
  final String title;
  final Color background;
  final Color textColor;
  Function() onClick;

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.itemWidth,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: widget.onClick,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}