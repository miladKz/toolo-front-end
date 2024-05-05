import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/fake_data/fake_data.dart';
import 'package:toolo_gostar/presentation/pages/screen_document_detail.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/custom_view_with_data_table.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/account_tree_view/account_tree_view_builder.dart';
import 'package:toolo_gostar/presentation/widgets/main/accounting_modals/show_account_form.dart';
import 'package:toolo_gostar/presentation/widgets/main/accounting_modals/show_group_form.dart';
import 'package:toolo_gostar/presentation/widgets/main/action_pinned_menu.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/actions_toolbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/account_document_main_toolbar_action_items.dart';
import 'package:toolo_gostar/presentation/widgets/main/documents/modals/create_or_update_document_master_modal.dart';
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
import 'logout_button.dart';

class MainBaseBody extends StatelessWidget {
  MainBaseBody({super.key});

  Workspace workSpaceMenu = Workspace();
  ActionPinnedMenu pinnedWorkSpaceMenu = ActionPinnedMenu();

  @override
  Widget build(BuildContext context) {
    double widthScree = MediaQuery.sizeOf(context).width;
    return Flex(
      direction: Axis.horizontal,
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
    double width = 300;//(widthScreen * 0.2).clamp(270, 300.0);
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
          /*    showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowCreateOrUpdateDocumentMasterModal(
                    maxWidth: maxWidth, isCreate: true);
              });*/
          DataTableViewModel dataTableViewModel = DataTableViewModelFactory
              .createTableViewModelFromAccountingDocumentMaster(
              documentMaster: mainBloc.documentMasterList);

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
                    onTap: (data) {
                      selectedDocumentMaster = data as DocumentMaster;
                    },
                    onDoubleTap: (data) {
                      selectedDocumentMaster = data as DocumentMaster;

                      gotoDocumentDetailScreen(documentMaster: data);
                    },
                    viewModel: dataTableViewModel,
                    //viewModel: FakeData.getAccountingDocumentMain(),
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

  void gotoDocumentDetailScreen({required DocumentMaster documentMaster}) {


    Get.to(BlocProvider(
      create: (_) {
        return locator.get<DocDetailBloc>();
      },
      child: ScreenDocumentDetail(
        documentMaster: documentMaster,
      ),
    ));
  }
}

AccountTreeViewBuilder accountTreeView = AccountTreeViewBuilder();
AccountDetailView accountDetailView = AccountDetailView();

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

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

class ShowCreateOrUpdateDocumentMasterModal extends StatelessWidget {
  ShowCreateOrUpdateDocumentMasterModal({super.key,
    required this.maxWidth,
    required this.isCreate,
    this.documentMaster});

  final double maxWidth;
  final bool isCreate;
  DocumentMaster? documentMaster;
  final mainBloc = locator.get<MainBloc>();

  @override
  Widget build(BuildContext context) {
    final Widget body = isCreate
        ? CreateOrUpdateDocumentMasterModal.create(
      formWidth: maxWidth,
      formKey: GlobalKey<FormState>(),
      onCreateOrUpdateStatus: (isSuccess) {
        onCreateOrUpdateStatus(isSuccess);
      },
    )
        : CreateOrUpdateDocumentMasterModal.update(
      formWidth: maxWidth,
      formKey: GlobalKey<FormState>(),
      documentMaster: documentMaster,
      onCreateOrUpdateStatus: (isSuccess) {
        onCreateOrUpdateStatus(isSuccess);
      },
          );

    return BlocProvider<MainBloc>.value(
      value: mainBloc,
      child: CustomDialog(
          title: localization.titleNewDocument, width: maxWidth, body: body),
    );
  }

  void onCreateOrUpdateStatus(bool isSuccess) {
    if (mainBloc.lastApiCalled == ApiEnum.accountDocument) {
      locator
          .get<MainBloc>()
          .add(MainAnotherList(endpoint: "", apiEnum: ApiEnum.accountDocument));
    }
  }
}
