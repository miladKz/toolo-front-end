import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_pinned_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/actions_toolbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/account_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/profile.dart';
import 'package:toolo_gostar/presentation/widgets/main/search_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../blocs/main_bloc/main_bloc.dart';
import 'account_tree_view/account_tree_view_builder.dart';
import 'action_tree_view/action_tree_view_builder.dart';
import 'badge_button.dart';
import 'collapsible_sidebar/collapsible_item.dart';
import 'collapsible_sidebar/collapsible_sidebar.dart';
import 'dashboard_menu.dart';
import 'forms/show_account_form.dart';
import 'forms/show_group_form.dart';
import 'logout_button.dart';

class MainBaseBody extends StatelessWidget {
  MainBaseBody({super.key});

  Workspace workSpaceMenu = Workspace();
  ActionPinnedMenu pinnedWorkSpaceMenu = ActionPinnedMenu();
  AccountTreeViewBuilder mainActionsDetailWidget = AccountTreeViewBuilder();

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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Assets.img.icnTooloPadideh
                                .image(width: 70, height: 30),
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
                            child: ActionsTreeViewBuilder(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      flex: 8,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            buildToolbar(toolBarEnum: ToolBarEnum.accountMainToolbar),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  mainActionsDetailWidget,
                                  showAccountInfoInForm(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BlocBuilder<MainBloc, MainState> showAccountInfoInForm() {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) {
        return current is MainAccountDetailInFormVisibility ||
            current is MainUpdatedAccountSuccess;
      },
      builder: (context, state) {
        bool isDetailFormState = (state is MainAccountDetailInFormVisibility);
        if (isDetailFormState && !state.isShow) {
          return const SizedBox().visible(false);
        } else {
          if (isDetailFormState && state.account?.accountLevel == 0) {
            return ShowGroupForm(account: state.account!);
          } else if (state is MainAccountDetailInFormVisibility) {
            return ShowAccountForm(
              account: state.account!,
            );
          }

          if (state is MainUpdatedAccountSuccess &&
              state.account.accountLevel == 0) {
            return ShowGroupForm(account: state.account);
          } else if (state is MainUpdatedAccountSuccess) {
            return ShowAccountForm(
              account: state.account,
            );
          }
          return const SizedBox().visible(false);
        }
      },
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
