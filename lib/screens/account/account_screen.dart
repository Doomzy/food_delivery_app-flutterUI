import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/loginsignup_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<LoginSignupProvider>(
            builder: (context, lsp, child) => Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(top: 70),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 30.0,
                        spreadRadius: 4,
                        offset: Offset(0.0, 0.75),
                      )
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo/logo1.png',
                        scale: 1.3,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controlsBtn(
                            title: 'Login',
                            isActive: lsp.currentTab == 0 || lsp.currentTab == 2
                                ? true
                                : false,
                            onPressed: () => lsp.changeTab(0),
                          ),
                          const SizedBox(width: 40),
                          controlsBtn(
                            title: 'Sign-up',
                            isActive: lsp.currentTab == 1 ? true : false,
                            onPressed: () => lsp.changeTab(1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 50,
                    bottom: 35,
                    start: 45,
                    end: 45,
                  ),
                  child: Form(
                    child: lsp.accTabs[lsp.currentTab],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget controlsBtn({
    required title,
    required VoidCallback onPressed,
    required bool isActive,
  }) =>
      MaterialButton(
        minWidth: 120,
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: isActive == true
                ? const Color.fromRGBO(250, 74, 12, 1)
                : Colors.transparent,
            width: 3,
          ),
        ),
      );
}
