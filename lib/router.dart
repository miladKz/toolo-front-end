import 'package:flutter/material.dart';

class AtrasPageRouter{
 static goTo(BuildContext context,{required Widget widget}){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => widget));
  }
}

