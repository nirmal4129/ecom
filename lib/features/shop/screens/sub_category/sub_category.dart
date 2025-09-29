import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/common/widgets/images/rounded_image.dart';
import 'package:ecom/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:ecom/common/widgets/texts/section_heading.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              // banner image
              TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.promoBanner1),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // subcategory
              Column(
                children: [
                  // heading
                  SectionHeading(title: 'Sports Shirts',onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=> const ProductCardHorizontal(),
                        separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems,),
                        itemCount: 6),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
