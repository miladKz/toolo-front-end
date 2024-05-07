import 'package:flutter/material.dart';

Widget linearGap = Container(
  height: 1,
  padding: const EdgeInsets.only(top: 2, bottom: 2),
  color: const Color(0xffCCCCCC),
);

const titleStyle = TextStyle(
    color: Color(0xff69696A), fontSize: 10, fontWeight: FontWeight.w700);

Widget linearTitle({required String title, TextStyle style = titleStyle}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: style.copyWith(color: const Color(0xffA7A7A7)),
        ),
      ),
      Flexible(
          child: Container(
        height: 1,
        color: const Color(0xffCCCCCC),
      ))
    ],
  );
}
