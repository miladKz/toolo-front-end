import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/factories/table_view_model_factory.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/custom_view_with_data_table.dart';
import 'package:toolo_gostar/presentation/widgets/report/filters_view/filter_t_g_t_sh.dart';

import '../../../blocs/report_bloc/report_bloc.dart';

class ReportPageTGTSh extends StatelessWidget {
  const ReportPageTGTSh({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Flexible(flex: 2, child: rightReportFilterView()),
         Flexible(flex: 8, child: LeftReportFilterView()),
      ],
    );
  }

  Widget rightReportFilterView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilterTGTShView(
        onChangeFilter: (body) {},
      ),
    );
  }
}

class LeftReportFilterView extends StatefulWidget {
  LeftReportFilterView({
    super.key,
  });

  DataTableViewModel? dataTableViewModel;

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
            return widget.dataTableViewModel == null
                ? emptyData()
                : CustomViewWithDataTable(
              isShowActionButtons: false,
              isShowSearchBox: false,
              backgroundColor: const Color(0xffF8F8F8),
              formWidth: constraints.maxWidth,
              onTap: (data) {},
              viewModel: widget.dataTableViewModel!,
            );
          },
        ));
  }

  void listenToApi() {
    final state = context.watch<ReportBloc>().state;
    if (state is ReportSuccessTTG) {
      setState(() {
        widget.dataTableViewModel =
            DataTableViewModelFactory.createTableViewModelFromReportTGTSh(
                reportTarazTafziliGroup: state.model);
      });
    }
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
