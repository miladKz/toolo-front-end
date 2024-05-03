
import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

class AdvanceFiltersButton extends StatefulWidget {
  AdvanceFiltersButton({super.key, required this.height, required this.body});

  final double height;
  final Widget body;
  bool isExpand = true;

  @override
  State<AdvanceFiltersButton> createState() => _AdvanceFiltersButtonState();
}

class _AdvanceFiltersButtonState extends State<AdvanceFiltersButton> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration baseDecoration = BoxDecoration(
        color: const Color(0xffF9FAFB), borderRadius: BorderRadius.circular(5));
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          setState(() {
            widget.isExpand = !widget.isExpand;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height,
              decoration: baseDecoration,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: baseDecoration.copyWith(color: const Color(0xffEFE0F5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localization.titleAdvanceFilter,
                      style: const TextStyle(
                          color: Color(0xff616161),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      widget.isExpand
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: const Color(0xff616161),
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            verticalGapDivider,
            widget.body.visible(widget.isExpand)
          ],
        ),
      ),
    );
  }
}