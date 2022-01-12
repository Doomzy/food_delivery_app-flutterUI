import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/components/components.dart';

Widget changepassTab(VoidCallback changeTap) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(50, 30),
            alignment: Alignment.centerLeft,
          ),
          onPressed: changeTap,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(178, 178, 178, 1),
          ),
        ),
        const Text(
          'Forgot password?',
          style: TextStyle(
            color: Color.fromRGBO(248, 119, 74, 1),
            fontSize: 36,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 25),
        customTextField(
          prefix: const Icon(Icons.email),
          hint: 'Enter your email address',
        ),
        const Text(
          '* We will send you a message to set or reset your new password',
          style: TextStyle(
            color: Color.fromRGBO(178, 178, 178, 1),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 35),
        const Text(
          'Send code',
          style: TextStyle(
            color: Color.fromRGBO(178, 178, 178, 1),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Container(
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Color.fromRGBO(231, 96, 71, 0.47),
                      blurRadius: 26.0,
                      spreadRadius: 10,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
                child: const Icon(Icons.arrow_forward),
              ),
              backgroundColor: const Color.fromRGBO(248, 119, 74, 1),
            ),
          ],
        ),
      ],
    );
