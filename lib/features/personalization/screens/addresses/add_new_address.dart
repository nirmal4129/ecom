import 'package:ecom/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,
      title: Text(
        'Add New Address',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              children: [
                Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              children: [
                Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'Street'),)),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),
            const SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Save')),)
          ],
        )),),
      ),
    );
  }
}
