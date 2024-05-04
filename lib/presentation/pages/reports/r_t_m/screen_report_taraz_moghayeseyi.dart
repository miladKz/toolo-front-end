import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/pages/reports/r_t_m/report_page_t_m.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../blocs/report_bloc/report_bloc.dart';

class ScreenReportTarazMoghayeseyi extends StatefulWidget {
  const ScreenReportTarazMoghayeseyi({super.key});

  @override
  State<ScreenReportTarazMoghayeseyi> createState() => _ScreenReportTarazMoghayeseyiState();
}

class _ScreenReportTarazMoghayeseyiState extends State<ScreenReportTarazMoghayeseyi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: atrasDirection(context),
          child: BlocListener<ReportBloc, ReportState>(
            listener: (context, state) {
              if (state is ReportLoadingOnView) {
                progressDialog(isShow: state.isShow);
              }
            },
            child: BlocBuilder<ReportBloc, ReportState>(
              buildWhen: (previous, current) {
                if (current is MainInitial) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return Container(
                    color:  Colors.white, child: InitView());
              },
            ),
          )),
    );
  }
}

class InitView extends StatefulWidget{
  InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
  bool isBaseDataFetch=false;
}

class _InitViewState extends State<InitView> {


  @override
  Widget build(BuildContext context) {
    if(!widget.isBaseDataFetch){
      locator.get<MainBloc>().add(FetchBaseData());
    }
    listenToBaseData();
    return widget.isBaseDataFetch ? const ReportPageTM():const Center(child: CircularProgressIndicator(),);
  }

  void listenToBaseData() {
    final state=context.watch<MainBloc>().state;
    if(state is SuccessFetchBaseDataModel){
      setState(() {
        widget.isBaseDataFetch=true;
      });
    }
  }
}
