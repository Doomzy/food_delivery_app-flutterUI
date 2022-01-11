import 'package:flutter/material.dart';

Widget circleLogo() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        Image.asset(
          'assets/logo/logo.png',
          width: 100,
        ),
      ],
    );
Widget customButton({
  required text,
  required VoidCallback onPressed,
  bgColor = Colors.white,
  textColor = const Color.fromRGBO(255, 70, 10, 1),
}) =>
    MaterialButton(
      color: bgColor,
      textColor: textColor,
      height: 70,
      minWidth: double.infinity,
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: onPressed,
    );
