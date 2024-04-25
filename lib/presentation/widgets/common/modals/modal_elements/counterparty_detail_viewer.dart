import 'package:flutter/material.dart';

import '../../../../../domain/entities/common/counterparty_detail.dart';
import '../../../../../main.dart';
import 'form_item_title.dart';

class CounterpartyDetailViewer extends StatefulWidget {
  CounterpartyDetail counterpartyDetail;
  final Color addButtonBackground = const Color(0xFFEFEFF4);

  CounterpartyDetailViewer({super.key, required this.counterpartyDetail});

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

  Container body() {
    return Container(
      height: 100,
      child: Expanded(
          child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormItemTitle(
                      title: "لورم ایپسوم",
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                    FormItemTitle(
                      title: (400000 * 2).toString(),
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                    Container(
                      width: 100,
                      height: 33,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEFEFF4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: const Size.fromRadius(20),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(Icons.delete_outline,
                                color: Color(0xFFDC3545)),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEFEFF4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: Size.fromRadius(20),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(Icons.mode_outlined,
                                color: Color(0xFF198754)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                divider(dividerThickness: 1)
              ],
            ),
          );
        },
      )),
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
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.addButtonBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xFF6F42C1),
                    size: 20,
                  ),
                  Container(
                    color: Color(0xFFCED4DA),
                    width: 1,
                    height: 20,
                    margin: EdgeInsets.only(left: 5, right: 2),
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
        )
      ],
    );
  }

  Divider divider({double dividerHeight = 25, double dividerThickness = 2}) {
    return Divider(
      color: const Color(0xFFDEE2E6),
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }
}
