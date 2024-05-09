import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

class CustomDialog extends StatelessWidget {

 final String title;
 final double width;
 final Widget body;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.width,
      required this.body});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero, // Remove padding around the dialog
      child: BlocProvider<MainBloc>.value(
        value: locator.get<MainBloc>(),
        child: SingleChildScrollView(
          child: Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF9F9F9)),
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E6),
                    height: 25,
                    thickness: 2,
                  ),
                  body
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
