import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/main_base_body.dart';

import '../blocs/main_bloc/main_bloc.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: atrasDirection(context),
          child: BlocListener<MainBloc, MainState>(
            listener: (context, state) {
              if (state is MainLoadingOnView) {
                //isDisable = true;
                progressDialog(isShow: state.isShow);
              }
            },
            child: BlocBuilder<MainBloc, MainState>(
              buildWhen: (previous, current) {
                if (current is AccountingActionsReceived ||
                    current is MainLoadingOnView) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return Container(
                    color: const Color(0xFFF9F9F9),
                    child:  MainBaseBody());
              },
            ),
          )),
    );
  }
}
