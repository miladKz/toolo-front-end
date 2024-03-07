import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
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
                    BlocBuilder<MainBloc, MainState>(
                      builder: (context, state) {
                        return Flexible(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF0F0F0),
                                borderRadius: BorderRadius.circular(11)),
                            child: state is AccountingActionsReceived
                                ? _buildWorkSpaceDetailMenu(state.actions)
                                : const SizedBox(),
                          ),
                        );
                      },
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
                                  child: ExpandableMenu(
                                    widthScreen: widthScree,
                                    height: 40,
                                    width: widthScree * 0.035,
                                    items: _expandableItems(widthScree),
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

  Widget _buildWorkSpaceDetailMenu(List<AccountingAction> items) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(11)),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return WorkSpaceDetailMenu(item: items[index], isRoot: true);
          },
        ));
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
        trailing: SizedBox(),
        title: Expanded(
            child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          decoration: BoxDecoration(
              color: Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(5)),
          child: Row(children: [
            _isExpanded
                ? Icon(Icons.remove,
                size: widget.iconSize, color: Color(0xFF6C3483))
                : Icon(Icons.add,
                size: widget.iconSize, color: Color(0xFFBD8AD0)),
            const SizedBox(width: 5),
            Text(
              "10 - دارایی غیر تجاری",
              style: TextStyle(fontSize: 14, color: Color(0xFF616161), fontWeight: FontWeight.bold),
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
