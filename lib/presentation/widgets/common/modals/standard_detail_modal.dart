import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../snakbar.dart';
import 'modal_elements/modal_action_buttons.dart';

class StandardDetailModal extends StatefulWidget {
  StandardDetailModal({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
    required this.standardDetail,
  }) : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final StandardDetail standardDetail;
  StandardDetail? tempStandardDetail;

  late bool isUpdate;

  @override
  State<StandardDetailModal> createState() => _StandardDetailModalState();
}

class _StandardDetailModalState extends State<StandardDetailModal> {
  final TextEditingController titleController = TextEditingController(text: '');

  final TextEditingController valueController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    locator.get<MainBloc>().add(OnLoadRevolvingFundTypes());
  }

  @override
  Widget build(BuildContext context) {
    checkSate();
    widget.isUpdate = (widget.standardDetail.id > 0);

    if (widget.isUpdate) {
      copyStandardDetailToTempStandardDetail();

      titleController.text = widget.standardDetail.name.toString();
      valueController.text = widget.standardDetail.description;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleBox(width: widget.formWidth, controller: titleController),
        verticalGapDivider,
        valueBox(width: widget.formWidth, controller: valueController),
        verticalGapDivider,
        const SizedBox(
          height: 20,
        ),
        ModalActionButtons(
          formWidth: widget.formWidth,
          formKey: widget._formKey,
          onConfirm: () {
            widget.standardDetail.name = titleController.text;
            widget.standardDetail.description = valueController.text;

            if (widget.isUpdate) {
              locator
                  .get<MainBloc>()
                  .add(OnUpdateStandardDetail(widget.standardDetail));
            } else {
              locator
                  .get<MainBloc>()
                  .add(OnCreateStandardDetail(widget.standardDetail));
            }
          },
        )
      ],
    );
  }

  Widget titleBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.title),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  Widget valueBox(
      {required double width, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormItemTitle(title: localization.value),
        titleInputSpacing,
        FormTextField(
          controller: controller,
          enable: true,
          widgetWidth: width,
        ),
      ],
    );
  }

  double getItemWidth({int itemsCount = 2, required maxWidth}) {
    return (((maxWidth) / itemsCount) - 25);
  }

  void copyStandardDetailToTempStandardDetail() {
    widget.tempStandardDetail = StandardDetail(
      name: widget.standardDetail.name,
      id: widget.standardDetail.id,
      bargeTypeID: widget.standardDetail.bargeTypeID,
      description: widget.standardDetail.description,
      section: widget.standardDetail.section,
    );
  }

  void checkSate() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessCreateStandardDetail ||
        state is SuccessUpdateStandardDetail) {
      Navigator.of(context).pop();
    } else if (state is FailedUpdateStandardDetail) {
      debugPrint('update standardDetail error: ${state.errorMessage}');
      //Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is FailedCreateStandardDetail) {
      debugPrint('generate standardDetail error: ${state.errorMessage}');
      // Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    }
  }
}
