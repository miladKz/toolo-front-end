import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_main.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/auth/base_body.dart';

String token = '';

class ScreenFiscalYear extends StatefulWidget {
  const ScreenFiscalYear({super.key});

  @override
  State<ScreenFiscalYear> createState() => _ScreenFiscalYearState();
}

class _ScreenFiscalYearState extends State<ScreenFiscalYear> {
  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = locator<AuthBloc>();
    FiscalYearBloc fiscalYearBloc = locator<FiscalYearBloc>();
    token = bloc.authBaseData!.token;
    fiscalYearBloc.add(FiscalYearGetData(token: token));
    bool isDisable = false;
    return Scaffold(
      body: BlocListener<FiscalYearBloc, FiscalYearState>(
        listener: (context, state) {
          if (state is FiscalYearLoadingOnView) {
            isDisable = true;
            progressDialog(isShow: state.isShow);
          } else {
            progressDialog(isShow: false);
            isDisable = false;

            if (state is FiscalYearFinishWork) {
              Get.offAll(screenMain());
            }
          }
        },
        child: BlocBuilder<FiscalYearBloc, FiscalYearState>(
          builder: (context, state) {
            bool isSuccess = (state is FiscalYearSuccess);
            return isSuccess
                ? Directionality(
                    textDirection: TextDirection.ltr,
                child: baseBody(
                        isAuthView: false, authBloc: bloc, enable: !isDisable))
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget screenMain() {
    return const ScreenMain();
  }
}
