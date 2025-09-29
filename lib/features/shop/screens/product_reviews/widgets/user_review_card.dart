import 'package:ecom/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom/common/widgets/products/ratings/custom_rating_bar_indicator.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.user),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe',style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),

        // Review
        Row(
          children: [
            CustomRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('25 May, 2025',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText(
          'The user interface of this app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        // company review
        TRoundedContainer(
          backgroundColor: isDark?TColors.darkerGrey:TColors.grey,
          child: Padding(padding: EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",style: Theme.of(context).textTheme.bodyLarge,),
                    Text('28 May, 2025',style: Theme.of(context).textTheme.bodyMedium,)
                  ],

              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ReadMoreText(
                'The user interface of this app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: ' show less',
                trimCollapsedText: 'show more',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
              )
            ],
          ),),

        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
