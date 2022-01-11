import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/main_provider.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingCard {
  String content;
  String img;
  OnBoardingCard({
    required this.content,
    required this.img,
  });
}

class OnboardingScreen extends StatelessWidget {
  var pageController = PageController();

  List<OnBoardingCard> onboardingList = [
    OnBoardingCard(
      content: 'Save Food with our new Feature!',
      img: 'img1.png',
    ),
    OnBoardingCard(
      content: 'Set preferences for multiple users from various restaurants!',
      img: 'img2.png',
    ),
    OnBoardingCard(
      content: 'Fast, rescued food at your service.',
      img: 'img3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, mp, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 75, 58, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
          elevation: 0,
          actions: [
            MaterialButton(
              onPressed: () => mp.finishOnBoarding(context),
              child: const Text(
                'Skip >>',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              circleLogo(),
              SizedBox(height: 10),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (i) {
                    if (i == onboardingList.length - 1) {
                      mp.onBoardingStatus(true);
                    } else {
                      mp.onBoardingStatus(false);
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, i) => onBoardingSlide(
                      content: onboardingList[i].content,
                      img: onboardingList[i].img),
                  itemCount: onboardingList.length,
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 50,
                  end: 50,
                  top: 10,
                  bottom: 30,
                ),
                child: Visibility(
                  visible: mp.lastOnBoarding,
                  replacement: SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingList.length,
                    effect: const WormEffect(
                      dotColor: Color.fromRGBO(255, 133, 93, 1),
                      activeDotColor: Colors.white,
                      spacing: 13,
                      dotHeight: 9,
                      dotWidth: 9,
                    ),
                  ),
                  child: customButton(
                    text: 'Get started!',
                    onPressed: () => mp.finishOnBoarding(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onBoardingSlide({required String content, required img}) => Column(
        children: [
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Metropolis',
              fontSize: content.split(' ').length <= 6 ? 55 : 40,
            ),
          ),
          Image.asset(
            'assets/onboarding/$img',
            height: 300,
          ),
          const Spacer()
        ],
      );
}
