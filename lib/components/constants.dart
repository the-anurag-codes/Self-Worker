import 'package:flutter/material.dart';

TextStyle kLoginTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 18, letterSpacing: 6.0);

Widget kDivider = Row(children: [
  Expanded(
    child: Container(
        margin: const EdgeInsets.only(
          left: 10.0,
          right: 20.0,
        ),
        child: const Divider(
          color: Colors.white,
          height: 36,
        )),
  ),
  const Text(
    "OR",
  ),
  Expanded(
    child: Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 10.0,
        ),
        child: const Divider(
          color: Colors.white,
          height: 36,
        )),
  ),
]);