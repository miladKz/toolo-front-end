import 'package:flutter/material.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/auth/auth_screen_widget.dart';
import 'package:toolo_gostar/presentation/widgets/fiscal_year/fiscal_year_screen_widget.dart';

const double rightItemHeight = 142;
const double rightItemMargin = 20;
const double borderRadius = 35;
const double inputBorder = 8;
const double inputGapPadding = 4;
bool isEnable = true;

Widget baseBody({
  required bool isAuthView,
  required AuthBloc authBloc,
  required bool enable,
}) {
  isEnable = enable;
  return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.tight(
          const Size(double.infinity, (double.infinity / 1.68))),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWith = constraints.maxWidth / 1.45;
          double mainMaxWith = maxWith / 3.34;
          double leftViewMaxWith = (constraints.maxWidth / 2.1);
          const double rightViewMaxWith = 41;
          return Stack(alignment: Alignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(rightViewMaxWith + rightItemMargin),
              child: Container(
                  width: maxWith,
                  height: constraints.maxHeight,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x21656AF5),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: isAuthView
                      ? authMainBox(
                          inputBorder: inputBorder,
                          inputGapPadding: inputGapPadding,
                          boxConstraints: BoxConstraints(
                              maxWidth: mainMaxWith,
                              maxHeight: constraints.maxHeight),
                          authBloc: authBloc,
                          enable: isEnable)
                      : fiscalYearMainBox(
                          inputBorder: inputBorder,
                          inputGapPadding: inputGapPadding,
                          boxConstraints: BoxConstraints(
                              maxWidth: mainMaxWith,
                              maxHeight: constraints.maxHeight),
                          fiscalYearBloc: locator<FiscalYearBloc>(),
                          enable: isEnable)),
            ),
            Positioned(
                top: (maxHeight / 3.9) + 50,
                left: 10,
                child: versionLeftView()),
            Positioned(
              left: 0,
              child: Assets.img.imgLeft.image(
                  fit: BoxFit.fill,
                  width: leftViewMaxWith,
                  height: constraints.maxHeight / 1.49),
            ),
            rightView(rightItemHeight, borderRadius, rightItemMargin,
                rightViewMaxWith),
          ]);
        },
      ));
}

Widget versionLeftView() {
  return Column(
    children: [
      const SizedBox(
        height: 50,
      ),
      Transform(
        transform: Matrix4.identity()
          ..translate(0.0, 0.0)
          ..rotateZ(3.14),
        child: Container(
          width: 20,
          height: 120,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(-2, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(child: textVersion()),
        ),
      ),
    ],
  );
}

Positioned rightView(double rightItemHeight, double borderRadius,
    double rightItemMargin, double rightItemWith) {
  return Positioned(
    right: 0,
    bottom: (rightItemHeight / 2 + borderRadius),
    child: Container(
      margin: EdgeInsets.only(right: rightItemMargin),
      padding: const EdgeInsets.all(2),
      width: rightItemWith,
      height: rightItemHeight,
      child: Container(
        width: rightItemWith,
        height: rightItemHeight,
        decoration: const ShapeDecoration(
          color: Color(0xFF6C3483),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.ico.icWebsite.image(width: 20, height: 20),
            const SizedBox(height: 8),
            Assets.ico.icSupportEmail.image(width: 20, height: 20),
            const SizedBox(height: 8),
            Assets.ico.icSupportCall.image(width: 20, height: 20),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
}

Widget textVersion() {
  return const RotatedBox(
    quarterTurns: 1,
    child: Text(
      'Version 10',
      style: TextStyle(
        color: Color(0xFF6D3483),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    ),
  );
}
