import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../main/cart/screens/cart_screen.dart';
import 'badge.dart' as bad;

class CartButton extends StatelessWidget {
  Color? color;
  Color? badgeColor;
  Color? textColor;
  CartButton({super.key, this.color, this.badgeColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, cart, ch) =>  bad.Badge(
        value: cart.itemCount.toString(),
        color: badgeColor == null
            ? Theme.of(context).colorScheme.secondary
            : badgeColor!,
        child: ch!,
        textColor: textColor,
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: color ?? Colors.black,
          size: 32,
        ),
      ),
    );
  }
}
