import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import 'cart_widget.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: cartProvider.items.length,
        itemBuilder: (ctx, i) {
          print(cartProvider.items[i].id);
          return Column(
            children: [
              CartWidget(
                id: cartProvider.items[i].id,
                quantity: cartProvider.items[i].quantity,
                product: cartProvider.items[i].product,
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          );
        });
  }
}
