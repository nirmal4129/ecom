import 'package:ecom/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/all_products/all_products.dart';
import 'package:ecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecom/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header part
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // appbar
                  const HomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //search bar
                  const SearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // categories
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // headings
                        const SectionHeading(
                          showActionButton: false,
                          title: 'Popular Categories',
                          textColor: TColors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // categories
                        const HomeCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections,)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // body part
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.md,
              ),
              child: Column(
                children: [
                  // promo slider
                  PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // heading
                  SectionHeading(title: 'Popular Products', onPressed: ()=>Get.to(()=>const AllProductsScreen())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // popular products
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return ProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
