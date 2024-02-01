import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/base_body.dart';

class ScreenFiscalYear extends StatefulWidget {
  const ScreenFiscalYear({super.key});

  @override
  State<ScreenFiscalYear> createState() => _ScreenFiscalYearState();
}

class _ScreenFiscalYearState extends State<ScreenFiscalYear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FiscalYearBloc, FiscalYearState>(
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.ltr,
              child: baseBody(
                isAuthView: false,
              ));
        },
      ),
    );
  }
}
