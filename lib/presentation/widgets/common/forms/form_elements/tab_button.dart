import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  TabButton({
    super.key,
    this.itemWidth,
    required this.title,
   // required this.background,
   // required this.textColor,
    required this.onClick,
     this.topLeft= 0,
     this.topRight= 0,
     this.bottomLeft= 0,
     this.bottomRight= 0,
  });

  final double? itemWidth;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final String title;
  final Color background = const Color(0xFFF0F0F0);
  final Color textColor = const Color(0xFF4F4F4F);
  Function() onClick;

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.topLeft),
            topRight: Radius.circular(widget.topRight),
            bottomLeft: Radius.circular(widget.bottomLeft),
            bottomRight: Radius.circular(widget.bottomRight),
          )),
        ),
        onPressed: widget.onClick,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Color(0xFFBC84D3),
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.textColor,
                      //fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
