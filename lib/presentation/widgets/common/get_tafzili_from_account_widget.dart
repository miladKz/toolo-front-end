import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/body/tafzili_data_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_and_child.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_child.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/main/account_have_tafzili_group_modal.dart';

class GetTafziliFromAccountWidget extends StatelessWidget{
  final TextEditingController controllerDocumentCode ;
  final TextEditingController controllerDocCodDesc ;

  final List<TextEditingController> controllersTafzili;
  final bool withTafzili;

  GetTafziliFromAccountWidget(
      {super.key,
      required this.controllerDocumentCode,
      required this.controllerDocCodDesc,
      this.controllersTafzili = const [],
      this.withTafzili=false});

  @override
  Widget build(BuildContext context) {

    List<TafziliDataBody> tafziliDataBodyList = List.empty(growable: true);
    return LayoutBuilder(builder: (context, constraints) {
      double rowWidth=constraints.maxWidth;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountCodeObject(
                rowWidth: rowWidth,
                controllerDocumentCode: controllerDocumentCode,
                controllerDocCodDesc: controllerDocCodDesc,
                withTafzili: withTafzili),
            verticalGapDivider,
            withTafzili
                ? TafziliDetailRow(
                    rowWidth: constraints.maxWidth,
                    controllersTafzili: controllersTafzili,
                    tafziliDataBodyList: tafziliDataBodyList)
                : const SizedBox().visible(false),
          ],
        );
      },);
  }
}

class AccountCodeObject extends StatefulWidget {
  final double rowWidth;
  final TextEditingController controllerDocumentCode;
  final TextEditingController controllerDocCodDesc;
  final bool withTafzili;

  const AccountCodeObject(
      {super.key,
        required this.rowWidth,
        required this.controllerDocumentCode,
      required this.controllerDocCodDesc,
      required this.withTafzili});

  @override
  State<AccountCodeObject> createState() => _AccountCodeObjectState();
}

class _AccountCodeObjectState extends State<AccountCodeObject> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (((widget.rowWidth) / 2) - 25);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        documentCodeBox(
            width: itemWidth, controller: widget.controllerDocumentCode),
        horizontalGapDivider,
        documentCodeDescBox(
            width: itemWidth, controller: widget.controllerDocCodDesc),
      ],
    );
  }

  Widget documentCodeBox(
      {required double width, required TextEditingController controller}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            //double formWidth = MediaQuery.of(context).size.width;
            double formWidth = 800;
            return CustomDialog(
              title: localization.titleNewRow,
              width: formWidth,
              body: AccountHaveTafziliGroupModal(
                onSelected: (AccountHaveTafziliGroup accountItem) {
                  debugPrint(
                      'AccountHaveTafziliGroupModal: ${accountItem.displayName}');
                  widget.controllerDocumentCode.value =
                      TextEditingValue(text: accountItem.accountcd);
                  widget.controllerDocCodDesc.value =
                      TextEditingValue(text: accountItem.description);
                  if (widget.withTafzili) {
                    locator.get<MainBloc>().add(
                        MainFetchTafziliGroupAndChildListWithAccountId(
                            accountId: accountItem.id));
                  }

                  Navigator.of(context).pop();
                },
              ),
            ); // Pass your account data here
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormItemTitle(title: ''),
          FormTextField(
            textHint: '66',
            controller: controller,
            enable: false,
            suffixIcon: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                ),
                onPressed: () {}),
            widgetWidth: width,
          ),
        ],
      ),
    );
  }

  Widget documentCodeDescBox(
      {required double width, required TextEditingController controller}) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormItemTitle(title: ''),
          FormTextField(
            textHint: '0',
            controller: controller,
            enable: false,
            widgetWidth: width,
          ),
        ],
      ),
    );
  }
}



class TafziliDetailRow extends StatefulWidget {
  final double rowWidth;
  List<TextEditingController> controllersTafzili;
  List<TafziliDataBody> tafziliDataBodyList;
  List<TafziliGroupAndChildren> tafziliGroupAndChildren =
  List.empty(growable: true);

  TafziliDetailRow(
      {super.key,
        required this.rowWidth,
        required this.controllersTafzili,
        required this.tafziliDataBodyList});

  @override
  State<TafziliDetailRow> createState() => _TafziliDetailRowState();
}

class _TafziliDetailRowState extends State<TafziliDetailRow> {
  @override
  Widget build(BuildContext context) {
    listenToTafziliDataFetch();
    return SizedBox(
        width: widget.rowWidth,
        child: Column(
          children: getChildren(),
        )).visible(widget.tafziliGroupAndChildren.isNotEmpty);
  }

  List<Widget> getChildren() {
    widget.controllersTafzili.clear();
    widget.tafziliDataBodyList.clear();
    List<Widget> widgetList = List.empty(growable: true);
    for (TafziliGroupAndChildren item in widget.tafziliGroupAndChildren) {
      TextEditingController controller = TextEditingController(text: '');
      widget.controllersTafzili.add(controller);
      widget.tafziliDataBodyList
          .add(TafziliDataBody(tafziliGroupID: item.id, tafziliID: -1));
      double itemWidth = (((widget.rowWidth) / 2) - 25);
      widgetList.add(
        tafziliItem(
            itemWidth: widget.rowWidth, controller: controller, item: item),
      );
      widgetList.add(verticalGapDivider);
    }
    return widgetList;
  }

  Widget tafziliItem(
      {required double itemWidth,
        required TextEditingController controller,
        required TafziliGroupAndChildren item}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle(title: item.name, textColor: const Color(0xffA7A7A7)),
        titleInputSpacing,
        TafziliDropBox(
          itemWidth: itemWidth,
          childItems: item.tafziliList,
          controller: controller,
          onSelectItem: (item) {
            debugPrint(
                'Tafzili onSelectItem: name= ${item.name} and id= ${item.id}');
            controller.text = '${item.id}';
          },
        ),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            tafziliDropBox(
              itemWidth: itemWidth*2,
              childItems: item.tafziliList,
              controller: TextEditingController(text: ''),
              onSelectItem: (item) {
                debugPrint('Tafzili onSelectItem: name= ${item.name} and id= ${item.id}');
                controllerName.value =TextEditingValue(text: item.name);
                controllerName.text = item.name;
                controller.value = TextEditingValue(text: '${item.id}');
              },
            ),
           */ /* horizontalGapDivider,
            FormTextField(
              textHint: '',
              controller: controllerName,
              enable: true,
              widgetWidth: itemWidth,
            ),*/ /*
          ],
        )*/
      ],
    );
  }

  void listenToTafziliDataFetch() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessFetchTafziliGroupAndChildList) {
      setState(() {
        widget.tafziliGroupAndChildren = state.items;
      });
    }
  }
}

class TafziliDropBox extends StatefulWidget {
  final List<TafziliGroupChild> childItems;
  final TextEditingController controller;
  final Function(TafziliGroupChild) onSelectItem;
  final double itemWidth;

  const TafziliDropBox(
      {super.key,
        required this.childItems,
        required this.controller,
        required this.onSelectItem,
        required this.itemWidth});

  @override
  State<TafziliDropBox> createState() => _TafziliDropBoxState();
}

class _TafziliDropBoxState extends State<TafziliDropBox> {
  TafziliGroupChild? selectedValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: widget.itemWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<TafziliGroupChild>(
                  iconStyleData: const IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                      ),
                    ),
                    iconSize: 16,
                  ),
                  alignment: atrasAlignment(context),
                  isExpanded: true,
                  hint: FormItemTitle(title: ""),
                  items: widget.childItems.map((item) {
                    return DropdownMenuItem(
                      enabled: true,
                      alignment: atrasAlignment(context),
                      value: item,
                      child: FormItemTitle(title: '${item.code}-${item.name}'),
                    );
                  }).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      widget.onSelectItem(value!);
                      selectedValue = value;
                    });
                  },
                  underline: const SizedBox(),
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 40,
                    width: widget.itemWidth,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: widget.itemWidth,
                    maxHeight: double.infinity,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: widget.controller,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                            right: 4, top: 4, left: 4, bottom: 2),
                        child: FormTextField(
                          textHint: localization.searchIn,
                          controller: widget.controller,
                        )),
                    searchMatchFn: (item, searchValue) {
                      return item.value!.name.contains(searchValue);
                    },
                  ),
                  //This to clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      widget.controller.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
