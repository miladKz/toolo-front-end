import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/pages/reports/r_t_t_sh_h/report_page_t_t_sh_h.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../blocs/report_bloc/report_bloc.dart';

class ScreenReportTarazTafziliShenavarHesab extends StatefulWidget {
  const ScreenReportTarazTafziliShenavarHesab({super.key});

  @override
  State<ScreenReportTarazTafziliShenavarHesab> createState() => _ScreenReportTarazTafziliShenavarHesabState();
}

class _ScreenReportTarazTafziliShenavarHesabState extends State<ScreenReportTarazTafziliShenavarHesab> {
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
  bool isBaseDataFetch=baseDataModel.categoryList.isNotEmpty;
}

class _InitViewState extends State<InitView> {


  @override
  Widget build(BuildContext context) {
    if(!widget.isBaseDataFetch){
      locator.get<MainBloc>().add(FetchBaseData());
    }
    listenToBaseData();
    return widget.isBaseDataFetch ? const ReportPageTTShH():const Center(child: CircularProgressIndicator(),);
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
