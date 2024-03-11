import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

import '../../../../domain/entities/accounting/account.dart';

class TreeViewItem extends StatefulWidget {
  Account account;
  final String title;
  final double fontSize;
  final double textScale;
  final Function() onTap;

   TreeViewItem({
    required this.account,
    required this.title,
    required this.fontSize,
    required this.textScale,
    required this.onTap,
    super.key,
  });

  @override
  State<TreeViewItem> createState() => _TreeViewItemState();
}

class _TreeViewItemState extends State<TreeViewItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width * 0.2;

    EdgeInsets childMargin =
        const EdgeInsets.only(right: 10, left: 1, top: 2, bottom: 2);
    return GestureDetector(
      onTap: () {
          context.read<MainBloc>().add(OnClickOnAccount(widget.account));
      },

      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) => setState(() => _isHovered = false),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _isHovered ? Color(0xFFEFE0F5) : Colors.white),
          width: double.maxFinite,
          margin: childMargin,
          constraints: const BoxConstraints(maxHeight: 30),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 1, left: 10, bottom: 4, top: 4),
            child: Text(
              widget.title,
              textScaler:
                  TextScaler.linear(widthScreen < 200 ? widget.textScale : 1),
              style: TextStyle(
                  color: _isHovered
                      ? const Color(0xFF6C3483)
                      : const Color(0xFF7B7B84),
                  fontWeight: FontWeight.normal,
                  fontSize: widget.fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
