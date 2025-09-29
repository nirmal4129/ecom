import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../../common/widgets/products/carts/cart_items.dart';
import '../../../../../common/widgets/texts/product_price.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons=true, this.itemCount=10, this.isListScrollable= true});

  final bool showAddRemoveButtons;
  final int itemCount;
  final bool isListScrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: isListScrollable?null:NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return Column(
          children: [
            CartItem(),

            if (showAddRemoveButtons) ...[
              const SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // add remove buttons
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      ProductQuantityWithAddAndRemoveButton(),
                    ],
                  ),

                  ProductPrice(price: '250'),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
