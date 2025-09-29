import 'package:ecom/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:ecom/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_appbar/custom_appbar.dart';
import '../../../../common/widgets/products/ratings/custom_rating_bar_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: TAppBar(title: Text('Reviews and Ratings'), showBackArrow: true),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and reviews are verified and are from people who use the same type of device that you use',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // overall product ratings
              OverallProductRating(),
              CustomRatingBarIndicator(rating: 3.5,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // user review lists
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
