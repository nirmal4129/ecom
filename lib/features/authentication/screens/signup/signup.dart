import 'package:ecom/common/widgets/login_signup/form_divider.dart';
import 'package:ecom/common/widgets/login_signup/social_buttons.dart';
import 'package:ecom/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // divider
              FormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // social buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

