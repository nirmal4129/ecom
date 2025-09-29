import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';


class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),

          Row(
            children: images
                .map((url) => brandTopProductImage(url, context))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImage(String image, BuildContext context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor: THelperFunction.isDarkMode(context)
          ? TColors.darkerGrey
          : TColors.light,
      margin: EdgeInsets.only(right: TSizes.sm),
      padding: EdgeInsets.all(TSizes.md),
      child: Image(image: AssetImage(image)),
    ),
  );
}
