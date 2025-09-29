import 'package:ecom/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_appbar/custom_appbar.dart';
import '../../../../../common/widgets/products/carts/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppBarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.apply(color: TColors.white),
          ),
        ],
      ),
      actions: [CartCounterIcon(onPressed: ()=>Get.to(()=>const CartScreen()), iconColor: TColors.white)],
    );
  }
}
