import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/pined_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/profile.dart';
import 'package:toolo_gostar/presentation/widgets/main/search_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/tree_view/tree_view.dart';
import 'package:toolo_gostar/presentation/widgets/main/work_space_detail_menu/work_space_detai_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../../domain/entities/accounting/account.dart';
import '../../../domain/entities/accounting/accounting_action.dart';
import '../../blocs/main_bloc/main_bloc.dart';
import 'badge_button.dart';
import 'collapsible_sidebar/collapsible_item.dart';
import 'collapsible_sidebar/collapsible_sidebar.dart';
import 'dashboard_menu.dart';
import 'expandable_menu/accounting_action_items.dart';
import 'expandable_menu/expandable_menu.dart';
import 'forms/edit_account_form.dart';

class MainBaseBody extends StatefulWidget {
  MainBaseBody({super.key});

  @override
  State<MainBaseBody> createState() => _MainBaseBodyState();
}

class _MainBaseBodyState extends State<MainBaseBody> {

  RialyTypeItem rialyTypeItem = RialyTypeItem.other;
  Workspace workSpaceMenu = Workspace();

  @override
  void initState() {
    context.read<MainBloc>().add(AccountingEvent());
  }

  @override
  Widget build(BuildContext context) {
    double widthScree = MediaQuery.sizeOf(context).width;
    double heightScree = MediaQuery.sizeOf(context).height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CollapsibleSidebar(
          maxWidth: (widthScree * 0.17),
          minWidth: 70,
          isCollapsed: MediaQuery.of(context).size.width <= 950,
          items: _items,
          body: Container(),
          collapseOnBodyTap: true,
          onTitleTap: () {},
        ),
        Flexible(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, right: 12, bottom: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEFE0F5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Assets.img.icnTooloPadideh
                                .image(width: 70, height: 30),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: actionBarBadgedButton(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: logoutButton(),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth,
                                minWidth: constraints.minWidth),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF0F0F0),
                                borderRadius: BorderRadius.circular(11)),
                            child: WorkSpaceDetailWidgetTree(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Flexible(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 8),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        final maxWith = constraints.maxWidth;
                                        return CustomExpandableMenu(
                                          maxSpaceWidth: maxWith,
                                          height: 40,
                                          items: accountingActionsItem(maxWith),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AccountTreeViewWidget(),
                                       //EditAccountForm()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        onPressed: () {},
        icon: Assets.ico.icExit.image(width: 12, height: 12),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFF6C3483), width: 1),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  Widget actionBarBadgedButton() {
    return BadgeButton(
      label: localization.titleReceiveMessages,
      icon: Assets.ico.icMessage.image(width: 16, height: 16),
      backgroundColor: const Color(0xFFD9BCE4),
      textColor: const Color(0xFF706C71),
      badgeColor: const Color(0xFFE84336),
      badgeCount: 6,
      width: 150,
    );
  }

  List<CollapsibleItem> get _items {
    return [
      CollapsibleItem(
        content: const Profile(),
        iconImage: Assets.img.imgProfile.image(width: 52, height: 52),
        isSelected: true,
      ),
      CollapsibleItem(
        content: Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 4),
          child: SearchBox(),
        ),
        iconImage: Assets.ico.icSearch.image(width: 20, height: 20),
        isSelected: false,
      ),
      CollapsibleItem(
        content: const Divider(
          height: 1,
          color: Color(0xFFEFEFF4),
        ),
      ),
      CollapsibleItem(
        content: const DashboardMenu(),
        iconImage:
            Assets.ico.icDashboardNotSelected.image(width: 20, height: 20),
        //`iconImage` has priority over `icon` property
        isSelected: false,
      ),
      CollapsibleItem(
        content: const PinedMenu(),
        iconImage: Assets.ico.icPinNotSelected.image(width: 20, height: 20),
        //`iconImage` has priority over `icon` property
        isSelected: false,
      ),
      CollapsibleItem(
        content: workSpaceMenu,
        iconImage:
            Assets.ico.icCartableNotSelected.image(width: 20, height: 20),
        //`iconImage` has priority over `icon` property
        isSelected: false,
      )
    ];
  }

  List<Widget> _expandableItems(double widthScree) {
    double textSize = widthScree * 0.008;
    const double marginIconAndText = 6;
    double buttonWidth = widthScree * 0.079;
    double iconSize = widthScree * 0.014;

    return [
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFd1e7dd),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.control_point_rounded,
                  color: Color(0xFF198754),
                  size: iconSize,
                ),
                const SizedBox(
                  width: marginIconAndText,
                ),
                Text(
                  localization.newAccount,
                  style: TextStyle(
                      color: Color(0xFF198754),
                      fontWeight: FontWeight.bold,
                      fontSize: textSize),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xfff8d7da),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Color(0xffdc3545),
                  size: iconSize,
                ),
                const SizedBox(
                  width: marginIconAndText,
                ),
                Text(
                  localization.remove + localization.removeShortcut,
                  style: TextStyle(
                      color: Color(0xffdc3545),
                      fontWeight: FontWeight.bold,
                      fontSize: textSize),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffe9dcff),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mode_outlined,
                    color: Color(0xFF6610f2),
                    size: iconSize,
                  ),
                  const SizedBox(
                    width: marginIconAndText,
                  ),
                  Text(
                    localization.edit,
                    style: const TextStyle(
                        color: Color(0xFF6610f2),
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFffe5d0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.send_outlined,
                    color: Color(0xFFfd7e14),
                    size: iconSize,
                  ),
                  const SizedBox(
                    width: marginIconAndText,
                  ),
                  Text(
                    localization.send,
                    style: TextStyle(
                        color: Color(0xFFfd7e14),
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFefe0f5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rotate_90_degrees_cw_outlined,
                    color: Color(0xFF6c3483),
                    size: iconSize,
                  ),
                  const SizedBox(
                    width: marginIconAndText,
                  ),
                  Text(
                    localization.reset,
                    style: TextStyle(
                        color: Color(0xFF6c3483),
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFf7d6e6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.print_outlined,
                    color: Color(0xFFb02a37),
                    size: iconSize,
                  ),
                  const SizedBox(
                    width: marginIconAndText,
                  ),
                  Text(
                    localization.print,
                    style: const TextStyle(
                      color: Color(0xFFb02a37),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: buttonWidth,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFdee2e6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.toggle_off_outlined,
                    color: Color(0xFF6c757d),
                    size: iconSize,
                  ),
                  const SizedBox(
                    width: marginIconAndText,
                  ),
                  Text(
                    localization.deactivate,
                    style: TextStyle(
                        color: Color(0xFF6c757d),
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }
}


class AccountTreeViewWidget extends StatefulWidget {
  List<Account> items = List.empty();

  AccountTreeViewWidget({
    super.key,
  });

  @override
  State<AccountTreeViewWidget> createState() => _AccountTreeViewWidgetState();
}

class _AccountTreeViewWidgetState extends State<AccountTreeViewWidget> {
  @override
  Widget build(BuildContext context) {
    updateList();
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return TreeView(item: widget.items[index]);
          },
        ),
      ),
    );
  }

  void updateList() {
    final state = context.watch<MainBloc>().state;
    if (state is MainAccountReceived) {
      setState(() {
        widget.items = state.accounts;
      });
    }
  }
}

class WorkSpaceDetailWidgetTree extends StatefulWidget {
  List<AccountingAction> items = List.empty();

  WorkSpaceDetailWidgetTree({
    super.key,
  });

  @override
  State<WorkSpaceDetailWidgetTree> createState() =>
      _WorkSpaceDetailWidgetTreeState();
}

class _WorkSpaceDetailWidgetTreeState extends State<WorkSpaceDetailWidgetTree> {
  @override
  Widget build(BuildContext context) {
    updateList();
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(11)),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return widget.items.isNotEmpty
                ? WorkSpaceDetailMenu(item: widget.items[0], isRoot: true)
                : SizedBox();
          },
        ));
  }

  updateList() {
    final state = context.watch<MainBloc>().state;
    if (state is AccountingActionsReceived) {
      setState(() {
        widget.items = state.actions;
      });
    }
  }
}

enum RialyTypeItem {
  debtor,
  other,
}


