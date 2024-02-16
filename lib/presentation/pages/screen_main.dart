import 'package:flutter/material.dart';
import 'package:toolo_gostar/atras_direction.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: atrasDirection(context),
      child: Container(
        width: 100,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_2,
                  size: 52,
                ),
                SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    Text('مهدی زمانی',style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text('برنامه نویس',style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
