import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';

import '../../blocs/report_bloc/report_bloc.dart';
import '../main/badge_button.dart';
import '../main/logout_button.dart';
import 'balance_report_filter.dart';

class ReportBaseBody extends StatelessWidget {
  ReportBaseBody({super.key});

  BalanceReportFilter balanceReportFilter = const BalanceReportFilter();

  @override
  Widget build(BuildContext context) {
    double widthScree = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        rightReportFilterView(widthScree),
      ],
    );
  }

  Flexible rightReportFilterView(double widthScreen) {
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
                balanceReportFilter,
                const SizedBox(
                  width: 8,
                ),
                LeftSectionView(),
              ],
            )),
          ],
        ),
      ),
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
}


class LeftSectionView extends StatelessWidget {
  const LeftSectionView({
    super.key,
  });

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
              return emptyData();
            },
          )),
    );
  }

  void listenToApi() {
    //final state = context.watch<ReportBloc>().state;
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
