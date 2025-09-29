import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    this.maxLines = 1,
    this.isLarge = false,
    this.isThrough = false,
    this.currencySign = "\$",
    required this.price,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge, isThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: isThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleSmall!.apply(
              decoration: isThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}
