import 'package:flutter/material.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

import '../../../../gen/assets.gen.dart';

class ActionsTreeViewItem extends StatefulWidget {
  final AccountingAction item;
  final double fontSize;
  final double textScale;
  final Function() onTap;

  ActionsTreeViewItem({
    required this.item,
    required this.fontSize,
    required this.textScale,
    required this.onTap,
    super.key,
  });

  AccountingAction? selectedItem;
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
        setSelectedItem(widget.item);
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

  void setSelectedItem(AccountingAction item) {
    return setState(() {
      widget.selectedItem = item;
      item.endPoint.isEmpty
          ? callApiByEndpoint(item.description)
          : callApiByEndpoint(item.endPoint);
    });
  }
}

void callApiByEndpoint(String endPoint) {
  debugPrint('callApiByEndpoint endPoint=$endPoint');
  if (endPoint.contains('/api/acc/accounts')) {
    locator.get<MainBloc>().add(MainAccountList());
  } else if (endPoint.contains('شناور')) {
    locator.get<MainBloc>().add(MainAnotherList(
        endpoint: "", apiEnum: ApiEnum.managementFloatingDetails));
  } else if (endPoint.contains('ارتباط حساب')) {
    locator.get<MainBloc>().add(MainAnotherList(
        endpoint: "", apiEnum: ApiEnum.managementRelationShipAccount));
  } else if (endPoint.contains('اشخاص')) {
    locator
        .get<MainBloc>()
        .add(MainAnotherList(endpoint: "", apiEnum: ApiEnum.managementPeople));
  } else if (endPoint.contains('بانک')) {
    locator.get<MainBloc>().add(
        MainAnotherList(endpoint: "", apiEnum: ApiEnum.managementBankBranch));
  } else if (endPoint.contains('تنخواه')) {
    locator.get<MainBloc>().add(MainAnotherList(
        endpoint: "", apiEnum: ApiEnum.managementRevolvingFund));
  } else if (endPoint.contains('کارت')) {
    locator.get<MainBloc>().add(
        MainAnotherList(endpoint: "", apiEnum: ApiEnum.managementCardReader));
  }else if (endPoint.contains('اسناد حسابداری')) {
    locator.get<MainBloc>().add(
        MainAnotherList(endpoint: "", apiEnum: ApiEnum.accountDocument));
  } else {
    locator
        .get<MainBloc>()
        .add(MainAnotherList(endpoint: "", apiEnum: ApiEnum.unknown));
  }
}