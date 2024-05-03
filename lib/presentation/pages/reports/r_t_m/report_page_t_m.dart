import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_j_t.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_t_d_p.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_t_g_t_sh.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_t_m.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_t_t_sh.dart';

import '../../../blocs/report_bloc/report_bloc.dart';

class ReportPageTM extends StatelessWidget {
  const ReportPageTM({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Flexible(flex: 2, child: rightReportFilterView()),
        const Flexible(flex: 8, child: LeftReportFilterView()),
      ],
    );
  }

  Widget rightReportFilterView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilterTMView(
        onChangeFilter: (body) {},
      ),
    );
  }

}

class LeftReportFilterView extends StatefulWidget {
  const LeftReportFilterView({
    super.key,
  });


  @override
  State<LeftReportFilterView> createState() => _LeftReportFilterViewState();
}

class _LeftReportFilterViewState extends State<LeftReportFilterView> {
  @override
  Widget build(BuildContext context) {
    listenToApi();
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container();
          },
        ));
  }

  void listenToApi() {
    final state = context.watch<ReportBloc>().state;
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
