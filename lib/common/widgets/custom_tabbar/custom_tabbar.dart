import 'package:ecom/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key, required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Material(
      color: isDark?TColors.black:TColors.white,
      child: TabBar(
          isScrollable: true,
          padding: EdgeInsets.zero,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          tabAlignment: TabAlignment.start,
          labelColor: isDark?TColors.white:TColors.primary,
          tabs: tabs,
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
