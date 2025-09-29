import 'package:ecom/common/widgets/chips/choice_chips.dart';
import 'package:ecom/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom/common/widgets/texts/product_price.dart';
import 'package:ecom/common/widgets/texts/product_titles.dart';
import 'package:ecom/common/widgets/texts/section_heading.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        // selected attribute , pricing and description
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // title, price and stock status
              Row(
                children: [
                  SectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitle(title: 'Price : ', isSmall: true),
                          // actual price
                          ProductPrice(price: '250', isThrough: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          // sale price
                          ProductPrice(price: '180'),
                        ],
                      ),

                      Row(
                        children: [
                          const ProductTitle(title: 'Stock : ', isSmall: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              // variation discription
              ProductTitle(
                title:
                    'This is the discription of the product and it can go upto 4 lines',
                maxLines: 4,
                isSmall: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
              CustomChoiceChip(
                text: 'Green',
                selected: true,
                onSelected: (value) {},
              ),
              CustomChoiceChip(
                text: 'Blue',
                selected: false,
                onSelected: (value) {},
              ),
              CustomChoiceChip(
                text: 'Yellow',
                selected: false,
                onSelected: (value) {},
              ),
            ],)

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )

          ],
        ),
      ],
    );
  }
}
