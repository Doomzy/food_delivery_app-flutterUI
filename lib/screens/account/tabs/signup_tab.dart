import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/components/components.dart';

Widget signupTab(VoidCallback changeTap) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Register',
              style: TextStyle(
                color: Color.fromRGBO(248, 119, 74, 1),
                fontSize: 36,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            registerBtn(icon: 'assets/icons/google.png', onPressed: () {}),
            const SizedBox(width: 15),
            registerBtn(icon: 'assets/icons/facebook1.png', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 25),
        customTextField(
          hint: 'Full Name',
        ),
        customTextField(
          hint: 'Mobile Number',
        ),
        customTextField(
          hint: 'Password',
        ),
        customTextField(
          hint: 'Confirm Password',
        ),
        Row(
          children: [
            Expanded(
              child: customButton(
                onPressed: changeTap,
                text: 'Sign-up',
                bgColor: const Color.fromRGBO(248, 119, 74, 1),
                textColor: Colors.white,
                height: 60,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: changeTap,
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: Color.fromRGBO(178, 178, 178, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Already a Member? ',
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ],
    );

Widget registerBtn({required icon, required VoidCallback onPressed}) =>
    MaterialButton(
      elevation: 1,
      color: Colors.white,
      minWidth: 45,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      child: Image.asset(
        icon,
        scale: 3,
      ),
    );
