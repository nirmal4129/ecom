import 'package:ecom/common/widgets/brands/brand_card.dart';
import 'package:ecom/common/widgets/layout/grid_layout.dart';
import 'package:ecom/common/widgets/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/brands/brand_products.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // headings
              SectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),
              // brands layout
              GridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (_, index) => BrandCard(showBorder: true,onTap: ()=> Get.to(()=> const BrandProductsScreen()),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
