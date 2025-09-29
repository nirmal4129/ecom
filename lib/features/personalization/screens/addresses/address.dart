import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecom/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddress()),
        child: Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            SingleAddress(isSelectedAddress: false,),
            SingleAddress(isSelectedAddress: false,),
            SingleAddress(isSelectedAddress: true,),
            SingleAddress(isSelectedAddress: false,),
            SingleAddress(isSelectedAddress: true,),
            SingleAddress(isSelectedAddress: false,),
            SingleAddress(isSelectedAddress: true,),
            SingleAddress(isSelectedAddress: false,),
          ]),
        ),
      ),
    );
  }
}

