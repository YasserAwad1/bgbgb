import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import 'checkout_widget.dart';

class CheckoutItemsList extends StatelessWidget {
  const CheckoutItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cart.items.length,
        itemBuilder: (context, i) => CheckoutWidget(
          cartItem: cart.items[i],
        ),
      ),
    );
  }
}
