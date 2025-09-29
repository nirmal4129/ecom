import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit,color: TColors.white,)),
      title: Text('Coding With Codey',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('support@genzaideveloper.com',maxLines:1,overflow:TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white),),
    );
  }
}
