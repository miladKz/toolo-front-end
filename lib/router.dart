import 'package:flutter/material.dart';

class AtrasPageRouter {
  static goTo(BuildContext context,
      {required bool closeCurrent, required Widget widget}) {
    if (closeCurrent) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => widget));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
    }
  }
}
