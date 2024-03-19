import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

import '../../../../gen/assets.gen.dart';

class ActionsTreeViewItem extends StatefulWidget {
  final AccountingAction item;
  final double fontSize;
  final double textScale;
  final Function() onTap;

  const ActionsTreeViewItem({
    required this.item,
    required this.fontSize,
    required this.textScale,
    required this.onTap,
    super.key,
  });

  @override
  State<ActionsTreeViewItem> createState() => _ActionsTreeViewItemState();
}

class _ActionsTreeViewItemState extends State<ActionsTreeViewItem> {
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
                GestureDetector(
                  onTap: () {
                    widget.item.updatePinned(!widget.item.isPinned);
                    if(widget.item.isPinned){
                      locator.get<MainBloc>().add(AddPinnedActionEvent(widget.item));
                    }else{
                      locator.get<MainBloc>().add(RemovePinnedActionEvent(widget.item));
                    }

                  },
                  child: Assets.ico.icPinSelected.image(
                      width: 13,
                      height: 13,
                      color: _isHovered || widget.item.isPinned
                          ?const Color(0xFF6C3483)
                          :const Color(0xFFE7E7E7)),
                ),
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
        locator.get<MainBloc>().add(MainAccountList());
        break;
      case "":
        locator.get<MainBloc>().add(MainAnotherList(endpoint: ""));
        debugPrint("endpoint is: empty");
        break;
    }
  }
}
