import 'package:ecom/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom/common/widgets/success_screen/success_screen.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecom/navigation_menu.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_appbar/custom_appbar.dart';
import '../../../../common/widgets/products/carts/coupon_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../cart/widgets/cart_items.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // items in cart
              CartItems(
                showAddRemoveButtons: false,
                isListScrollable: false,
                itemCount: 2,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // coupon text field
              const CouponTextField(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // billing sections
              TRoundedContainer(
                showBorder: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    //pricing
                    const BillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    //divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // payment methods
                    const BillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // addresses
                    const BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success1',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$250'),
        ),
      ),
    );
  }
}
