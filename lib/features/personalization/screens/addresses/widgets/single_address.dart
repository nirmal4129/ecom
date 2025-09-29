import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key, this.isSelectedAddress = false,
  });

  final bool isSelectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: isSelectedAddress?TColors.primary.withOpacity(0.5):Colors.transparent,
      borderColor: isSelectedAddress?Colors.transparent:isDark?TColors.darkerGrey:TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            child: Icon(isSelectedAddress?Iconsax.tick_circle5:null,
            color: isSelectedAddress?isDark?TColors.light:TColors.dark:null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              Text('(+123) 456 7890',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Text('82356 Timmy Curves, South Liana, Miana, 87665, USA',softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
