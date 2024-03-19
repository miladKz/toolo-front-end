import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({super.key, this.onTap});

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        onPressed: onTap,
        icon: Assets.ico.icExit.image(width: 12, height: 12),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFF6C3483), width: 1),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
