import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/loginsignup_provider.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextField(hint: 'Username, Mobile Number'),
        customTextField(hint: 'Password'),
        TextButton(
          onPressed: () => Provider.of<LoginSignupProvider>(
            context,
            listen: false,
          ).changeTab(2),
          child: const Text(
            'Forgot password?',
            style: TextStyle(
              color: Color.fromRGBO(250, 74, 12, 1),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        customButton(
          onPressed: () =>
              navigateToAndRemove(context: context, destination: HomeScreen()),
          text: 'Login',
          bgColor: const Color.fromRGBO(248, 119, 74, 1),
          textColor: Colors.white,
          height: 55,
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Or',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        customButton(
          onPressed: () =>
              navigateToAndRemove(context: context, destination: HomeScreen()),
          text: 'Log In with Facebook',
          icon: 'assets/icons/facebook.png',
          bgColor: const Color.fromRGBO(24, 119, 242, 1),
          textColor: Colors.white,
          height: 55,
        ),
        const SizedBox(height: 20),
        customButton(
          onPressed: () =>
              navigateToAndRemove(context: context, destination: HomeScreen()),
          text: 'Log In with Google',
          icon: 'assets/icons/google.png',
          bgColor: Colors.white,
          textColor: const Color.fromRGBO(0, 0, 0, 0.54),
          height: 55,
        ),
      ],
    );
  }
}
