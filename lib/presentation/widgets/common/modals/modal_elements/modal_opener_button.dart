import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';

import '../../../../../domain/entities/common/abstracts/table_row_data_abs.dart';
import '../../../../view_models/table_view_model.dart';
import '../custom_view_with_data_table.dart';
import 'custom_dialog.dart';
import 'form_item_title.dart';

class ModalOpenerButton extends StatefulWidget {
  ModalOpenerButton(
      {super.key,
      required this.buttonWidth,
      required this.formWidth,
      required this.value,
      required this.dialogTitle,
      required this.onSelectItemFromTableModal,
      required this.dataTableViewModel,
      this.toolBarEnum = ToolBarEnum.standardDetailToolbar,
      required formKey});

  final double buttonWidth;
  final double formWidth;
  String value;
  String dialogTitle;
  DataTableViewModel? dataTableViewModel;
  ToolBarEnum toolBarEnum;

  final void Function(ITableRowData?) onSelectItemFromTableModal;
  late TextEditingController nameController =
      TextEditingController(text: value);

  @override
  State<ModalOpenerButton> createState() => _ModalOpenerButtonState();
}

class _ModalOpenerButtonState extends State<ModalOpenerButton> {
  ITableRowData? selectedItem;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.dataTableViewModel != null) {
          showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                title: widget.dialogTitle,
                width: widget.formWidth,
                body: CustomViewWithDataTable(
                    isShowActionButtons: true,
                    formWidth: widget.formWidth,
                    toolBarEnum: widget.toolBarEnum,
                    viewModel: widget.dataTableViewModel!,
                    onClickOnConfirmCallback: (selectedItem) {
                      this.selectedItem = selectedItem;
                      widget.nameController.text =
                          (selectedItem as ITableRowData).name;
                      Navigator.of(context).pop();
                      widget.onSelectItemFromTableModal(selectedItem);
                    },
                    formKey: _formKey),
              );
            },
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 10),
        width: widget.buttonWidth,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormItemTitle(
              title: (widget.dataTableViewModel == null)
                  ? localization.titleLoading
                  : widget.nameController.text,
              fontWeight: FontWeight.normal,
            ),
            const Icon(Icons.arrow_drop_down_outlined),
          ],
        ),
      ),
    );
  }
}
