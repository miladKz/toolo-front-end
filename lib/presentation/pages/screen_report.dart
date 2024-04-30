import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/report/report_base_body.dart';

import '../blocs/main_bloc/main_bloc.dart';
import '../blocs/report_bloc/report_bloc.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
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
                    color:  Colors.white, child: ReportBaseBody());
              },
            ),
          )),
    );
  }
}
