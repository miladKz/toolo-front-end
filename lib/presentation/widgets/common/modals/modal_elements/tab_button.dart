import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  TabButton(
      {super.key,
      this.itemWidth,
      required this.title,
      // required this.background,
      // required this.textColor,
      required this.onClick,
      this.topLeft = 0,
      this.topRight = 0,
      this.bottomLeft = 0,
      this.bottomRight = 0,
      required this.isSelected});

  final double? itemWidth;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final String title;
  final bool isSelected;
  final Color background = const Color(0xFFF0F0F0);
  final Color selectedBackground = const Color(0xFFEFE0F5);
  final Color textColor = const Color(0xFF4F4F4F);
  final Color selectedTextColor = const Color(0xFF6C3483);
  Function() onClick;

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    print(widget.isSelected);
    return Flexible(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isSelected
                  ? widget.selectedBackground
                  : widget.background,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
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
                    /*if (!widget.isSelected) ...[
                      const Icon(
                        Icons.add,
                        color: Color(0xFFBC84D3),
                        size: 15,
                      )
                    ],*/
                    const SizedBox(width: 5),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: widget.isSelected
                              ? widget.selectedTextColor
                              : widget.textColor,
                          fontWeight: widget.isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 130,
                height: 3.5,
                decoration: widget.isSelected
                    ? BoxDecoration(
                        color: const Color(0xFFBC84D3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      )
                    : null,
              ),
            ],
          )
        ],
      ),
    );
  }
}
