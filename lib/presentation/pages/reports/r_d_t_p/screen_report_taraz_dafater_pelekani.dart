import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/pages/reports/r_d_t_p/report_page_t_d_p.dart';

import '../../../blocs/main_bloc/main_bloc.dart';
import '../../../blocs/report_bloc/report_bloc.dart';

class ScreenReportTarazDafaterPelekani extends StatefulWidget {
  const ScreenReportTarazDafaterPelekani({super.key});

  @override
  State<ScreenReportTarazDafaterPelekani> createState() => _ScreenReportTarazDafaterPelekaniState();
}

class _ScreenReportTarazDafaterPelekaniState extends State<ScreenReportTarazDafaterPelekani> {
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
                    color:  Colors.white, child: ReportPageTDP());
              },
            ),
          )),
    );
  }
}
