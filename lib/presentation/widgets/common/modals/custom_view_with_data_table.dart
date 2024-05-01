import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../view_models/table_view_model.dart';
import '../../main/actions_toolbar/actions_toolbar.dart';
import '../../main/actions_toolbar/toolbar_enum.dart';
import 'modal_elements/custom_data_table.dart';
import 'modal_elements/modal_action_buttons.dart';
import 'modal_elements/modal_input_wrapper.dart';

class CustomViewWithDataTable extends StatelessWidget {
  CustomViewWithDataTable(
      {super.key,
      required this.formWidth,
      required this.viewModel,
      this.isActive = true,
      required GlobalKey<FormState> formKey,
      this.toolBarEnum,
      this.isShowActionButtons = true,
      this.isShowSearchBox = true,
      this.onTap,
      this.onDoubleTap,
      this.backgroundColor = Colors.white,
      this.onClickOnConfirmCallback})
      : _formKey = formKey;
  final bool isShowActionButtons;
  final bool isShowSearchBox;
  final bool isActive;
  final double formWidth;
  DataTableViewModel viewModel;
  final ToolBarEnum? toolBarEnum;
  final void Function(ITableRowData?)? onClickOnConfirmCallback;
  final GlobalKey<FormState> _formKey;
  Color backgroundColor;
  final TextEditingController searchInController =
      TextEditingController(text: '');
  final TextEditingController senderController =
      TextEditingController(text: '');

  /// Row tap handler, won't be called if tapped cell has any tap event handlers
  final Function(ITableRowData)? onTap;

  /// Row double tap handler, won't be called if tapped cell has any tap event handlers
  final Function(ITableRowData)? onDoubleTap;
  @override
  Widget build(BuildContext context) {
    CustomDataTable customDataTable = CustomDataTable(viewModel: viewModel);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        toolBarEnum != null
            ? row1(rowWidth: formWidth, toolBarEnum: toolBarEnum!)
            : const SizedBox().visible(false),
        verticalGapDivider,
        Column(
          children: [
            row2(rowWidth: formWidth),
            verticalGapDivider,
          ],
        ).visible(isShowSearchBox),
        customDataTable,
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: formWidth,
          formKey: _formKey,
          onConfirm: () {
            if (onClickOnConfirmCallback != null &&
                customDataTable.selectedItem != null) {
              onClickOnConfirmCallback!(customDataTable.selectedItem);
            }
          },
        ).visible(isShowActionButtons)
      ],
    );
  }

  Widget row1({required double rowWidth, required ToolBarEnum toolBarEnum}) {
    return SizedBox(
      width: rowWidth,
      child: myCustomToolbar(toolBarEnum: toolBarEnum, isActionShow: true),
    );
  }

  Widget row2({required double rowWidth}) {
    return SizedBox(
      width: rowWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [searchInBox(), horizontalGapDivider, senderBox()],
      ),
    );
  }

  searchInBox() {
    return ModalInputWrapper(
      inputWidth: 130,
      title: localization.searchIn,
      controller: searchInController,
      hintText: "----",
      enabled: false,
      suffixIcon: Icons.arrow_drop_down_sharp,
    );
  }

  senderBox() {
    return ModalInputWrapper(
      inputWidth: 240,
      title: localization.sender,
      controller: senderController,
      hintText: localization.enter,
      enabled: true,
      suffixIcon: Icons.search,
    );
  }
}
