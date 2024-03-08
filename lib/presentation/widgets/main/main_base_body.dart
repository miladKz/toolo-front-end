import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/expandable_menu/accounting_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/pined_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/profile.dart';
import 'package:toolo_gostar/presentation/widgets/main/search_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/work_space_detail_menu/work_space_detai_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../../domain/entities/accounting/accounting_action.dart';
import '../../blocs/main_bloc/main_bloc.dart';
import 'badge_button.dart';
import 'collapsible_sidebar/collapsible_item.dart';
import 'collapsible_sidebar/collapsible_sidebar.dart';
import 'dashboard_menu.dart';
import 'expandable_menu/expandable_menu.dart';
import 'tree_view/tree_view_item.dart';

class MainBaseBody extends StatelessWidget {
  const MainBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScree = MediaQuery.sizeOf(context).width;

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
                            constraints: BoxConstraints(maxWidth: constraints.maxWidth,minWidth: constraints.minWidth),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF0F0F0),
                                borderRadius: BorderRadius.circular(11)),
                            child:WorkSpaceDetailWidgetTree(),
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
                                TreeView()
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
        content: const Workspace(),
        iconImage:
            Assets.ico.icCartableNotSelected.image(width: 20, height: 20),
        //`iconImage` has priority over `icon` property
        isSelected: false,
      )
    ];
  }
}

class WorkSpaceDetailWidgetTree extends StatefulWidget {

  List<AccountingAction> items=List.empty();
   WorkSpaceDetailWidgetTree({
    super.key,
  });

  @override
  State<WorkSpaceDetailWidgetTree> createState() => _WorkSpaceDetailWidgetTreeState();
}

class _WorkSpaceDetailWidgetTreeState extends State<WorkSpaceDetailWidgetTree> {
  @override
  Widget build(BuildContext context) {
    updateList();
    return SizedBox(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(11)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return WorkSpaceDetailMenu(item:  widget.items[index], isRoot: true);
            },
          )),
    );
  }

  updateList(){
   final state= context.watch<MainBloc>().state;
   if(state is AccountingActionsReceived){
     setState(() {
       widget.items=state.actions;
     });
   }
  }
}

class TreeView extends StatefulWidget {

  double iconSize;

  TreeView(
      {Key? key,
        this.iconSize = 15})
      : super(key: key);
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (isExpanded) =>
          setState(() => _isExpanded = isExpanded),
      trailing: const SizedBox(),
      title: Expanded(
          child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            _isExpanded
                ? Icon(Icons.remove,
                    size: widget.iconSize, color: Color(0xFF6C3483))
                : Icon(Icons.add,
                    size: widget.iconSize, color: Color(0xFFBD8AD0)),
            const SizedBox(width: 5),
            Text(
              "10 - دارایی غیر تجاری",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.bold),
            )
          ],),
        )),
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, left: 55),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xFFDFE3E7),
                  width: 1,
                ),
              ),
            ),
            child: Column(children: [
              TreeViewItem(title: "زمین", fontSize: 18,textScale: 1,onTap: (){},),
              TreeViewItem(title: "ساختمان", fontSize: 18,textScale: 1,onTap: (){},),
              TreeViewItem(title: "تاسیسات", fontSize: 18,textScale: 1,onTap: (){},),
            ], )
        ),
      ],
    );
  }
}
