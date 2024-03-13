import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';

import '../../../gen/assets.gen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName= '';
  String displayName= '';
  @override
  void initState() {
    context.read<MainBloc>().add(LoadUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if(state is LoadUserDataState){
          userName = state.userData.userName;
          displayName = state.userData.displayName;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Assets.img.imgProfile.image(width: 52, height: 52),
                 Padding(
                  padding:const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style:const TextStyle(
                            color: Color(0xff616161), fontSize: 12),
                      ),
                     const SizedBox(
                        height: 2,
                      ),
                      Text(
                        userName,
                        style:const TextStyle(
                            color: Color(0xff8D8D8D), fontSize: 10),
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
      },
    );
  }
}
