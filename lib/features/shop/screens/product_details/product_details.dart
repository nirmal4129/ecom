import 'package:ecom/common/widgets/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/bottom_add_to_card.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
            ProductImageSlider(),

            /// product details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Rating and Share button
                  RatingAndShare(),

                  // product metadata
                  ProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // product attributes
                  ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // description
                  SectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is the product description and we can add anything here but i am not going to add anything now and will update it later.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        title: 'Reviews(100)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                        icon: Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
