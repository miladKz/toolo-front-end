import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/accounting/detail_group.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';

import '../../../../../main.dart';
import '../../../common/modals/modal_elements/check_box_form.dart';
import '../../../common/modals/modal_elements/drop_down_generic.dart';
import '../../../common/modals/modal_elements/modal_action_buttons.dart';

class ModalGroupRelationshipManagement extends StatelessWidget {
  const ModalGroupRelationshipManagement({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
    required this.detailGroups,
  }) : _formKey = formKey;
  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final List<DetailGroup> detailGroups;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dropBoxLastLevel(),
        verticalGapDivider,
        dropBoxDetailGroup(items: List.empty()),
        verticalGapDivider,
        dropBoxShowPlace(),
        verticalGapDivider,
        showListCheckBox(),
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: formWidth,
          formKey: _formKey,
          onConfirm: () {},
        )
      ],
    );
  }

  Widget dropBoxLastLevel() {
    List<DropDownItem> items = [
      DropDownItem(name: localization.active),
      DropDownItem(name: localization.deactivate)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleLastLevelAccountCode),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: isActive,
          itemWidth: (formWidth * 0.9),
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget dropBoxDetailGroup({required List<DetailGroup> items}) {
    /*List<DetailGroup> detailGroup = List.empty(growable: true);
    detailGroup.add(DetailGroup(id: 1, name: "اشخاص", code: '',type: 0,children: []));
    detailGroup.add(DetailGroup(id: 2, name: "بانک ها", code: '',type: 0,children: []));
    detailGroup.add(DetailGroup(id: 3, name: "صندوق ها", code: '',type: 0,children: []));
    detailGroup.add(DetailGroup(id: 3, name: "سایر", code: '',type: 0,children: []));*/
    List<DetailGroupRoot> detailGroup=baseDataModel.detailGroupRootList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleDetailGroup),
        titleInputSpacing,
        GenericDropDown<DetailGroupRoot>(
          isEnable: isActive,
          itemWidth: (formWidth * 0.9),
          value: detailGroup[0],
          items: detailGroup,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget dropBoxShowPlace() {
    List<DropDownItem> items = [
      DropDownItem(name: localization.active),
      DropDownItem(name: localization.deactivate)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.titleShowPlace),
        titleInputSpacing,
        GenericDropDown<IDropDownItem>(
          isEnable: isActive,
          itemWidth: (formWidth * 0.9),
          value: items[0],
          items: items,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget showListCheckBox() {
    final List<String> checkBoxName = [
      localization.titleCustomers,
      localization.titleSupplier,
      localization.titlePersonnel,
      localization.titleIntermediary,
      localization.titleInvestor,
      localization.titlePartners,
      localization.titleRecipientsFacility,
      localization.titleFacilitators,
      localization.titleRelatedPersons,
      localization.titleOther,
    ];
    double maxWidth = formWidth * 0.8;
    double itemWidth = maxWidth / 3;
    double itemHeight = 40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.hintShow),
        titleInputSpacing,
        SizedBox(
          width: formWidth * 0.8,
          child: GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            childAspectRatio: (itemWidth / itemHeight),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 3,
            children: getCheckBoxList(checkBoxName),
          ),
        )
      ],
    );
  }

  List<Widget> getCheckBoxList(List<String> checkBoxName) {
    List<Widget> widgets = List.empty(growable: true);
    for (String title in checkBoxName) {
      widgets.add(FormCheckBox(value: true, title: title));
    }
    return widgets;
  }
}
