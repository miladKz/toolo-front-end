import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/assets.gen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Assets.img.imgProfile.image(width: 52, height: 52),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مهدی زمانی',
                    style: TextStyle(color: Color(0xff616161), fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'برنامه نویس فلاتر',
                    style: TextStyle(color: Color(0xff8D8D8D), fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 25,
          height: 25,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffEFE0F5).withOpacity(0.5),
                borderRadius: BorderRadius.circular(4)),
            child: const Text(
              '...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.2,
                  color: Color(0xff6C3483),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
