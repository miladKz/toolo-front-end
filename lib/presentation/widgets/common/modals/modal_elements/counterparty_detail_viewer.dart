import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/counter_party_detail_modal.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/base/enums/customer_detail_type.dart';
import '../../../../../domain/entities/common/counterparty_detail.dart';
import '../../../../../main.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';
import '../../../../question_dialog.dart';
import 'custom_dialog.dart';
import 'form_item_title.dart';

class CounterpartyDetailViewer extends StatefulWidget {
  String addModalTitle;
  List<CounterpartyDetail> items;
  CustomerDetailType customerDetailType;
  final Color addButtonBackground = const Color(0xFFEFEFF4);

  CounterpartyDetailViewer(
      {super.key,
      required this.items,
      required this.addModalTitle,
      required this.customerDetailType});

  @override
  State<CounterpartyDetailViewer> createState() =>
      _CounterpartyDetailViewerState();
}

class _CounterpartyDetailViewerState extends State<CounterpartyDetailViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: const Color(0xFFE9EBEE))),
      child: Column(
        children: [header(), divider(dividerThickness: 1), body()],
      ),
    );
  }

  Widget body() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Column(
              children: [detailRowItem(index), divider(dividerThickness: 1)],
            ),
          );
        },
      ),
    );
  }

  Row detailRowItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FormItemTitle(
          title: widget.items[index].name,
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
        FormItemTitle(
          title: widget.items[index].value,
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
        removeAndEditButton(index),
      ],
    );
  }

  SizedBox removeAndEditButton(int index) {
    return SizedBox(
      width: 100,
      height: 33,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [deleteButton(index), updateButton(index)],
      ),
    );
  }

  ElevatedButton updateButton(int index) {
    return ElevatedButton(
      onPressed: () {
        CounterpartyDetail counterpartyDetail = widget.items[index];
        if (counterpartyDetail.id == 0) {
          counterpartyDetail.id = -1;
        }
        openCounterpartyDetailModal(counterpartyDetail);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEFEFF4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size.fromRadius(20),
        padding: EdgeInsets.zero,
      ),
      child: const Icon(Icons.mode_outlined, color: Color(0xFF198754)),
    );
  }

  ElevatedButton deleteButton(int index) {
    return ElevatedButton(
      onPressed: () {
        CounterpartyDetail counterpartyDetail = widget.items[index];
        showQuestionDialog(
          context: context,
          title: localization.remove,
          msg: localization.msgQuestionDelete,
          callBack: (isOk) {
            if (isOk) {
              locator
                  .get<MainBloc>()
                  .add(OnDeleteCustomerDetail(counterpartyDetail));
            }
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEFEFF4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size.fromRadius(20),
        padding: EdgeInsets.zero,
      ),
      child: const Icon(Icons.delete_outline, color: Color(0xFFDC3545)),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FormItemTitle(
          title: localization.title,
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
        FormItemTitle(
          title: localization.value,
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
        addButton()
      ],
    );
  }

  TextButton addButton() {
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.addButtonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: () {
        CounterpartyDetail counterpartyDetail =
        CounterpartyDetail.empty(widget.customerDetailType);
        openCounterpartyDetailModal(counterpartyDetail);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.add,
                color: Color(0xFF6F42C1),
                size: 20,
              ),
              Container(
                color: const Color(0xFFCED4DA),
                width: 1,
                height: 20,
                margin: const EdgeInsets.only(left: 5, right: 2),
              ),
              Text(
                localization.add,
                style: const TextStyle(
                    color: Color(0xFF7C848C),
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openCounterpartyDetailModal(CounterpartyDetail counterpartyDetail) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            title: widget.addModalTitle,
            width: 350,
            body: CounterpartyDetailModal(
                formWidth: 350,
                formKey: GlobalKey<FormState>(),
                counterpartyDetail: counterpartyDetail),
          );
        });
  }

  Divider divider({double dividerHeight = 25, double dividerThickness = 2}) {
    return Divider(
      color: const Color(0xFFDEE2E6),
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }
}