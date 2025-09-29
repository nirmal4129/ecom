import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/common/widgets/icons/circular_icon.dart';
import 'package:ecom/common/widgets/layout/grid_layout.dart';
import 'package:ecom/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../home/home.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
          children: [
            GridLayout(itemCount: 8, itemBuilder: (_,index)=>ProductCardVertical())
          ],
        ),),
      ),
    );
  }
}
