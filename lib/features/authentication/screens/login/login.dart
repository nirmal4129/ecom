import 'package:ecom/common/styles/spacing_styles.dart';
import 'package:ecom/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecom/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, title and subtitle
              LoginHeader(isDark: isDark),

              // Form
              LoginForm(),

              // Dividers
              FormDivider(
                dividerText: TTexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Footers
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
