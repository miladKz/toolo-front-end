import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/account_tree_view/account_tree_view_builder.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_pinned_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/profile.dart';
import 'package:toolo_gostar/presentation/widgets/main/search_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../blocs/report_bloc/report_bloc.dart';
import '../main/action_tree_view/action_tree_view_builder.dart';
import '../main/badge_button.dart';
import '../main/collapsible_sidebar/collapsible_item.dart';
import '../main/collapsible_sidebar/collapsible_sidebar.dart';
import '../main/dashboard_menu.dart';
import '../main/logout_button.dart';
import 'balance_report_filter.dart';

class ReportBaseBody extends StatelessWidget {
  ReportBaseBody({super.key});

  Workspace workSpaceMenu = Workspace();
  ActionPinnedMenu pinnedWorkSpaceMenu = ActionPinnedMenu();
  BalanceReportFilter filter = BalanceReportFilter();

  @override
  Widget build(BuildContext context) {
    double widthScree = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        rightColumn(widthScree, context),
        leftMainColumn(widthScree),
      ],
    );
  }

  Flexible leftMainColumn(double widthScreen) {
    return Flexible(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            actionBar(),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filter,
                const SizedBox(
                  width: 8,
                ),
                LeftSectionView(),
              ],
            )),
          ],
        ),
      ),
    );
  }

  CollapsibleSidebar rightColumn(double widthScree, BuildContext context) {
    return CollapsibleSidebar(
      maxWidth: (widthScree * 0.17),
      minWidth: 70,
      isCollapsed: MediaQuery.of(context).size.width <= 950,
      items: _items,
      collapseOnBodyTap: true,
      onTitleTap: () {},
    );
  }

  Widget actionTreeView(widthScreen) {
    double width = (widthScreen * 0.2).clamp(230, 280.0);
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(11)),
      child: ActionsTreeViewBuilder(width: width),
    );
  }

  Padding actionBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 12, bottom: 5),
        decoration: BoxDecoration(
            color: const Color(0xFFEFE0F5),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.img.icnTooloPadideh.image(width: 70, height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: actionBarBadgedButton(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: LogoutButton(),
                    ),
                  ],
                )
              ],
            ),
          ],
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
          color: Colors.white,
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
        content: pinnedWorkSpaceMenu,
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
}

class LeftSectionView extends StatefulWidget {
  LeftSectionView({
    super.key,
  });

  ApiEnum apiEnum = ApiEnum.unknown;

  @override
  State<LeftSectionView> createState() => _LeftSectionViewState();
}

class _LeftSectionViewState extends State<LeftSectionView> {
  @override
  Widget build(BuildContext context) {
    listenToApi();
    return Flexible(
      flex: 8,
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container();
            },
          )),
    );
  }

  void listenToApi() {
    final state = context.watch<ReportBloc>().state;
  }
}

AccountTreeViewBuilder accountTreeView = AccountTreeViewBuilder();
AccountDetailView accountDetailView = AccountDetailView();

class AccountWidget extends StatelessWidget {
  AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('_AccountWidgetState buil AccountWidget');
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [accountTreeView, accountDetailView],
      ),
    );
  }
}

class AccountDetailView extends StatefulWidget {
  AccountDetailView({
    super.key,
  });

  Widget currentWidget = Container();

  @override
  State<AccountDetailView> createState() => _AccountDetailViewState();
}

class _AccountDetailViewState extends State<AccountDetailView> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        '_AccountWidgetState buil currnetWidget=${widget.currentWidget}');
    checkState();
    return widget.currentWidget;
  }

  void checkState() {}
}

Widget emptyData() {
  return const Center(
      child: Text(
    'There is no data for this section',
    style: TextStyle(
        fontSize: 18, color: Colors.black38, fontWeight: FontWeight.w700),
  ));
}
