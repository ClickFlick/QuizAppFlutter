import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: const <TextSpan>[
        TextSpan(
          text: 'Quiz',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        TextSpan(
          text: 'App',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget blueButton({BuildContext context, String buttonText, buttonWidth} ){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30)),
    height: 60,
    alignment: Alignment.center,
    child: Text(
      buttonText,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    width: buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width - 48,
  );
}
