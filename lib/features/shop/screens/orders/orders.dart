import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/features/shop/screens/orders/widgets/order_list_items.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // orders
        child: OrderListItems(),
      ),
    );
  }
}
