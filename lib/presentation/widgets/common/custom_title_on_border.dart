import 'package:flutter/material.dart';

class CustomTitleOnBorder extends StatelessWidget {
  const CustomTitleOnBorder(
      {super.key,
      this.width = 300,
      this.height = 80,
      required this.borderRadius,
      this.borderColor = const Color(0xFFECECEC),
      this.backGroundColor = Colors.white,
      this.textColor = Colors.black,
      required this.body,
      required this.title,
      this.titleStyle = const TextStyle(
          color: Color(0xffA7A7A7),
          fontSize: 12,
          fontWeight: FontWeight.w500), this.titleFontSize=12});

  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  final Color backGroundColor;
  final Color textColor;
  final String title;
  final double titleFontSize;
  final TextStyle titleStyle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: width,minHeight: height),
          child: Stack(
            fit: StackFit.passthrough,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                top: (titleFontSize / 2) + 3,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: backGroundColor,
                      border: Border.all(width: 1, color: borderColor),
                      borderRadius: borderRadius),
                ),
              ),
              Positioned(
                right: 20,
                top: 0,
                child: Stack(

                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            height: 2,
                            color: backGroundColor,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        title,
                        style: titleStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 8,
                    right: 8,
                  ),
                  child: body//Container(color: Colors.black,width: 10,height: 10,),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
