import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

import '../../../../gen/assets.gen.dart';

class WorkspaceDetailMenuItem extends StatefulWidget {
  final AccountingAction item;
  final double fontSize;
  final double textScale;
  final Function() onTap;

  const WorkspaceDetailMenuItem({
    required this.item,
    required this.fontSize,
    required this.textScale,
    required this.onTap,
    super.key,
  });

  @override
  State<WorkspaceDetailMenuItem> createState() => _WorkspaceDetailMenuItemState();
}

class _WorkspaceDetailMenuItemState extends State<WorkspaceDetailMenuItem> {
  bool _isHovered = false;
  EdgeInsets childMargin = const EdgeInsets.only(right: 20);
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width * 0.2;
    return InkWell(
      onTap: () {
        getTreeByEndpoint(widget.item.endPoint);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });

        },
        onExit: (event) => setState(() => _isHovered = false),
        child: Container(
          width: double.infinity,
          margin: childMargin,
          constraints: const BoxConstraints(maxHeight: 40),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Assets.ico.icPinSelected.image(
                    width: 13,
                    height: 13,
                    color: _isHovered
                        ? Color(0xFF6C3483)
                        : Color(0xFFE7E7E7)),
                const SizedBox(width: 5),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.item.description,
                  textScaler: TextScaler.linear(
                      widthScreen < 200 ? widget.textScale : 1),
                  style: TextStyle(
                      color: _isHovered
                          ? const Color(0xFF6C3483)
                          : const Color(0xFF7B7B84),
                      fontWeight: FontWeight.normal,
                      fontSize: widget.fontSize - 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getTreeByEndpoint(String endPoint) {
    switch(endPoint){
      case "/api/acc/accounts":
          context.read<MainBloc>().add(MainAccountList());
          break;
      case "":
        print("endpoint is: empty");
        break;
    }
  }
}
