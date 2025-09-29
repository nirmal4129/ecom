import 'package:ecom/common/widgets/brands/brand_card.dart';
import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),

              SortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
