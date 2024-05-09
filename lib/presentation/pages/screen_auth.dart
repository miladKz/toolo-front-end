import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_fiscal_year.dart';
import 'package:toolo_gostar/presentation/widgets/auth/base_body.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/common/snakbar.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingOnView) {
            isDisable = state.isShow;
            progressDialog(isShow: state.isShow);
          } else {
            progressDialog(isShow: false);
            Future.delayed(Duration.zero);
            isDisable = false;

            if (state is AuthError) {
              showSnack(
                  title: 'Error Login', message: state.appException.message);
            }
          }

          if (state is AuthSuccess) {
            Get.to(BlocProvider.value(
              value: locator<FiscalYearBloc>(),
              child: const ScreenFiscalYear(),
            ),routeName: 'fiscalYear');
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            if(current is AuthVisibleUrlBox){
              return false;
            }
            return true;
          },
          builder: (context, state) {
            final authBloc = locator.get<AuthBloc>();

            return Directionality(
                textDirection: TextDirection.ltr,
                child: baseBody(
                    authBloc: authBloc, isAuthView: true, enable: !isDisable));
          },
        ),
      ),
    );
  }
}
