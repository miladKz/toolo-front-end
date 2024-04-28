import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty_detail.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_text_field.dart';
import 'package:toolo_gostar/presentation/widgets/common/widget_attributes_constants.dart';

import '../../../../../main.dart';
import '../../../blocs/main_bloc/main_bloc.dart';
import '../snakbar.dart';
import 'modal_elements/modal_action_buttons.dart';

class CounterpartyDetailModal extends StatefulWidget {
  CounterpartyDetailModal({
    super.key,
    required this.formWidth,
    this.isActive = true,
    required GlobalKey<FormState> formKey,
    required this.counterpartyDetail,
  }) : _formKey = formKey;

  final bool isActive;
  final double formWidth;
  final GlobalKey<FormState> _formKey;
  final CounterpartyDetail counterpartyDetail;
  CounterpartyDetail? tempCounterpartyDetail;

  late bool isUpdate;

  @override
  State<CounterpartyDetailModal> createState() =>
      _CounterpartyDetailModalState();
}

class _CounterpartyDetailModalState extends State<CounterpartyDetailModal> {
  final TextEditingController titleController = TextEditingController(text: '');

  final TextEditingController valueController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    locator.get<MainBloc>().add(OnLoadRevolvingFundTypes());
  }

  @override
  Widget build(BuildContext context) {
    checkState();
    widget.isUpdate = (widget.counterpartyDetail.id != 0);
    if (widget.isUpdate) {
      copyCounterpartyDetailToTempCounterpartyDetail();

      titleController.text = widget.counterpartyDetail.name;
      valueController.text = widget.counterpartyDetail.value;
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

            final isNameModified =
                widget.counterpartyDetail.name != titleController.text;
            final isValueModified =
                widget.counterpartyDetail.value != valueController.text;

            if (isNameModified || isValueModified) {
              widget.counterpartyDetail.name = titleController.text;
              widget.counterpartyDetail.value = valueController.text;
              widget.counterpartyDetail.isModified = true;
            }

            final event = widget.isUpdate
                ? OnUpdateCustomerDetail(widget.counterpartyDetail)
                : OnCreateCustomerDetail(widget.counterpartyDetail);

            locator.get<MainBloc>().add(event);
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

  void copyCounterpartyDetailToTempCounterpartyDetail() {
    widget.tempCounterpartyDetail = CounterpartyDetail(
      name: widget.counterpartyDetail.name,
      id: widget.counterpartyDetail.id,
      counterpartyId: widget.counterpartyDetail.counterpartyId,
      value: widget.counterpartyDetail.value,
      parentId: widget.counterpartyDetail.parentId,
      valueType: widget.counterpartyDetail.valueType,
    );
  }

  void checkState() {
    final state = context.watch<MainBloc>().state;
    if (state is SuccessCreateCustomerDetail ||
        state is SuccessUpdateCustomerDetail) {
      Navigator.of(context).pop();
    } else if (state is FailedUpdateCustomerDetail) {
      debugPrint('update CounterpartyDetail error: ${state.errorMessage}');
      //Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    } else if (state is FailedCreateCustomerDetail) {
      debugPrint('generate CounterpartyDetail error: ${state.errorMessage}');
      // Navigator.of(context).pop();
      Future.delayed(const Duration(microseconds: 20)).then((value) =>
          showSnack(
              title: localization.errorTitle, message: state.errorMessage));
    }
  }
}
