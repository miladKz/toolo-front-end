import 'package:flutter/material.dart';

class BadgeButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color badgeColor;
  final Image icon;
  final int badgeCount;
  final double width;
  final VoidCallback? onPressed;

  const BadgeButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.badgeColor = Colors.red,
    required this.icon,
    this.badgeCount = 0,
    required this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
      child: Badge(
        label: Text("$badgeCount"),
        backgroundColor: badgeColor ,
        textColor: const Color(0xFFFFFFFF),
        alignment: Alignment.topRight,
        offset: const Offset(7, -6),
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 icon,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                        color: Color(0xFF706C71),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
