import 'package:ecom/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:ecom/features/authentication/screens/onboarding/widgets/on_boarding_next_button.dart';
import 'package:ecom/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecom/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecom/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [

          // horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //Skip button
          const OnBoardingSkip(),

          // Dot navigation smooth page indicator
          const OnBoardingDotNavigation(),

          // circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
