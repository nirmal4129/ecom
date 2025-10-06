import 'package:ecom/common/widgets/images/circular_image.dart';
import 'package:ecom/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecom/common/widgets/texts/product_price.dart';
import 'package:ecom/common/widgets/texts/product_titles.dart';
import 'package:ecom/utils/constants/enums.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and sale price
        Row(
          children: [
            // sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              padding: EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              backgroundColor: TColors.secondary.withValues(alpha: 0.8),
              child: Text(
                '25%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // price
            ProductPrice(price: '250', isThrough: true),
            const SizedBox(width: TSizes.spaceBtwItems),
            ProductPrice(price: '250', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
        ProductTitle(title: 'Green Nike Sports Shoes'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            ProductTitle(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: TImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overLayColor: isDark ? TColors.white : TColors.black,
            ),
            BrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
