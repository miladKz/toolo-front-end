import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_fiscal_year.dart';
import 'package:toolo_gostar/presentation/widgets/base_body.dart';
import 'package:toolo_gostar/presentation/widgets/snakbar.dart';
import 'package:toolo_gostar/router.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) {
          if (current is AuthSuccess) {
            AtrasPageRouter.goTo(context,
                widget: BlocProvider(
                  create: (context) {
                    return FiscalYearBloc();
                  },
                  child: const ScreenFiscalYear(),
                ));
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state is AuthError) {
            showSnack(
                title: 'Error Login', message: state.appException.message);
          }
          final authBloc = context.read<AuthBloc>();
          return Directionality(
              textDirection: TextDirection.ltr,
              child: baseBody(
                authBloc: authBloc,
                isAuthView: true,
              ));
        },
      ),
    );
  }
}
