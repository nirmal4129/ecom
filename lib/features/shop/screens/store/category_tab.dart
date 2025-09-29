import 'package:ecom/common/widgets/layout/grid_layout.dart';
import 'package:ecom/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:ecom/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              BrandShowCase(
                images: [
                  TImages.productImage20,
                  TImages.productImage21,
                  TImages.productImage22,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              BrandShowCase(
                images: [
                  TImages.productImage20,
                  TImages.productImage21,
                  TImages.productImage22,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Products
              SectionHeading(title: 'You might like',onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems,),
              GridLayout(itemCount: 4, itemBuilder: (_,index)=>ProductCardVertical()),
            ],
          ),
        )
      ],
    );
  }
}
