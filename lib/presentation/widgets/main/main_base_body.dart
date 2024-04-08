import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/fake_data/fake_data.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/custom_view_with_data_table.dart';
import 'package:toolo_gostar/presentation/widgets/main/account_tree_view/account_tree_view_builder.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_pinned_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/actions_toolbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/floating_detail_tree_view/floating_detail_tree_view.dart';
import 'package:toolo_gostar/presentation/widgets/main/profile.dart';
import 'package:toolo_gostar/presentation/widgets/main/search_box.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menu.dart';

import '../../blocs/main_bloc/main_bloc.dart';
import '../../factories/table_view_model_factory.dart';
import '../../view_models/table_view_model.dart';
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
  AccountTreeViewBuilder accountTreeView = AccountTreeViewBuilder();

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
                actionTreeView(widthScreen),
                const SizedBox(
                  width:8,
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
          color: const Color(0xFFF0F0F0),
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
              return getChild(
                  apiEnum: widget.apiEnum, maxWidth: constraints.maxWidth);
            },
          )),
    );
  }

  Widget getChild({required double maxWidth, required ApiEnum apiEnum}) {
    final formKey = GlobalKey<FormState>();
    MainBloc mainBloc = context.watch<MainBloc>();
    switch (apiEnum) {
      case ApiEnum.accountList:
        {
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.accountMainToolbar,
                isActionShow: true,
              ),
              AccountWidget()
            ],
          );
        }
      case ApiEnum.managementFloatingDetails:
        {
          return Column(
            children: [
              myCustomToolbar(
                  isActionShow: true,
                  toolBarEnum:
                      ToolBarEnum.floatingDetailManagementModalToolbar),
              Expanded(
                child: FloatingDetailTreeView(items: FakeData.getFloatingDetailList),
              ),
            ],
          );
        }
      case ApiEnum.managementRelationShipAccount:
        {
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.groupRelationshipManagementMainToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: FloatingDetailTreeView(
                    items: FakeData.getRelationShipAccountManagement),
              ),
            ],
          );
        }
      case ApiEnum.managementPeople:
        {
          DataTableViewModel dataTableViewModel = DataTableViewModelFactory.createTableViewModelFromPersonList(mainBloc.counterpartyList);
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.peopleManagementModalToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: CustomViewWithDataTable(
                    isShowActionButtons: false,
                    formWidth: maxWidth,
                    viewModel: dataTableViewModel,
                    formKey: formKey),
              ),
            ],
          );
        }
      case ApiEnum.managementBankBranch:
        {
          DataTableViewModel dataTableViewModel = DataTableViewModelFactory.createTableViewModelFromBankList(mainBloc.counterpartyList);
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.bankBranchManagementModalToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: CustomViewWithDataTable(
                    isShowActionButtons: false,
                    formWidth: maxWidth,
                    viewModel: dataTableViewModel,
                    formKey: formKey),
              ),
            ],
          );
        }
      case ApiEnum.managementRevolvingFund:
        {
          DataTableViewModel dataTableViewModel = DataTableViewModelFactory.createTableViewModelFromRevolvingFund(mainBloc.counterpartyList);
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.revolvingFundManagementModalToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: CustomViewWithDataTable(
                    isShowActionButtons: false,
                    formWidth: maxWidth,
                    viewModel: dataTableViewModel,
                    formKey: formKey),
              ),
            ],
          );
        }
      case ApiEnum.managementCardReader:
        {
          DataTableViewModel dataTableViewModel = DataTableViewModelFactory.createTableViewModelFromCardReaderList(mainBloc.counterpartyList);
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.cardReaderManagementModalToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: CustomViewWithDataTable(
                    isShowActionButtons: false,
                    formWidth: maxWidth,
                    viewModel: dataTableViewModel,
                    formKey: formKey),
              ),
            ],
          );
        }  case ApiEnum.accountDocument:
        {
          return Column(
            children: [
              myCustomToolbar(
                toolBarEnum: ToolBarEnum.accountDocumentMainToolbar,
                isActionShow: true,
              ),
              Expanded(
                child: CustomViewWithDataTable(
                    isShowActionButtons: false,
                    formWidth: maxWidth,
                    viewModel: FakeData.getAccountingDocumentMain(),
                    formKey: formKey),
              ),
            ],
          );
        }
      case ApiEnum.unknown:
        {
          return emptyData();
        }
      default:
        {
          return emptyData();
        }
    }
  }

  void listenToApi() {
    final state = context.watch<MainBloc>().state;
    if (state is ApiChange) {
      setState(() {
        widget.apiEnum = state.apiEnum;
      });
    }
  }
}

AccountTreeViewBuilder accountTreeView = AccountTreeViewBuilder();
AccountDetailView accountDetailView = AccountDetailView();

class AccountWidget extends StatelessWidget {
  AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint(
        '_AccountWidgetState buil AccountWidget');
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          accountTreeView,
          accountDetailView
        ],
      ),
    );
  }
}

class AccountDetailView extends StatefulWidget {
  AccountDetailView({super.key,});
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

  void checkState() {
    final state = context.watch<MainBloc>().state;
    if (state is MainAccountDetailInFormVisibility) {
      if (state.isShow) {
        setState(() {
          if (state.account?.accountLevel == 0) {
            widget.currentWidget = ShowGroupForm(account: state.account!);
          } else {
            widget.currentWidget = ShowAccountForm(
              account: state.account!,
            );
          }
        });
      }

    } else if (state is MainUpdatedAccountSuccess) {
      setState(() {
        if (state.account.accountLevel == 0) {
          widget.currentWidget = ShowGroupForm(account: state.account);
        } else {
          widget.currentWidget = ShowAccountForm(
            account: state.account,
          );
        }
      });
    }
  }
}

Widget emptyData() {
  return const Center(
      child: Text(
    'There is no data for this section',
    style: TextStyle(
        fontSize: 18, color: Colors.black38, fontWeight: FontWeight.w700),
  ));
}

/*BlocBuilder<MainBloc, MainState> accountDetailView() {
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
}*/
