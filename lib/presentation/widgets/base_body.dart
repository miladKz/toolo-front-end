import 'package:flutter/material.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/auth_screen_widget.dart';

const double rightItemHeight = 142;
const double rightItemMargin = 20;
const double borderRadius = 35;
const double inputBorder = 8;
const double inputGapPadding = 4;

Widget baseBody({
  required bool isAuthView,
   AuthBloc? authBloc,
}) {
  return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.tight(
          const Size(double.infinity, (double.infinity / 1.68))),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxHeight = constraints.maxHeight;
          print('max= ${maxHeight}|| ${(constraints.maxHeight / 3.96)}');
          double maxWith = constraints.maxWidth / 1.45;
          double mainMaxWith = maxWith / 3.34;
          //double leftViewMaxWith = (constraints.maxWidth / 2.1) - mainMaxWith;
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
                    ? mainBox(
                        inputBorder: inputBorder,
                        inputGapPadding: inputGapPadding,
                        boxConstraints: BoxConstraints(
                            maxWidth: mainMaxWith,
                            maxHeight: constraints.maxHeight),
                        authBloc: authBloc!)
                    : Container(
                        color: Colors.blue,
                      ),
              ),
            ),
            Positioned(
                top: (maxHeight / 3.9) + 50,
                left: 10,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    version(),
                  ],
                )),
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
