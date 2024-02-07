import 'package:flutter/material.dart';

class Utils{
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String? text){
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red,);

    messengerKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}
// error: This expression has a type of 'void' so its value can't be used. (use_of_void_result at [self_worker] lib\components\utils.dart:11)