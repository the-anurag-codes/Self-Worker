import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Widget categoryTile(IconData icon, String title, String vacancy, Color color) {
  return Container(
    padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
    // width: 70,
    // height: 70,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      border: Border.all(color: Colors.black, width: 3.5)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          "$vacancy Jobs Vacancy",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const Icon(Icons.arrow_forward),
      ],
    ),
  );
}

Widget animatedText(String text, double size){
  const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = TextStyle(
    fontSize: size,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );

  return SizedBox(
    child: AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textAlign: TextAlign.center,
          textStyle: colorizeTextStyle,
          speed: Duration(milliseconds: 200),
          colors: colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      onTap: () {
        print("Tap Event");
      },
    ),
  );
}

Widget elevatedButton(String btnText, IconData icon,VoidCallback onTap){
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        side: const BorderSide(
          width: 4,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        )),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        Text(
          btnText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          size: 16,
          color: Colors.black,
        ),
      ],
    ),
  );
}

