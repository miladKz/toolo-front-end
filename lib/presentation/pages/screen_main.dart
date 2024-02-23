import 'package:flutter/material.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/presentation/widgets/main/main_base_body.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Directionality(textDirection: atrasDirection(context),
      child: Container(color: Color(0xFFF9F9F9),child: const MainBaseBody())),
    );
  }
}
