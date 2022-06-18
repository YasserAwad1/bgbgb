import 'package:flutter/material.dart';
import 'package:kay_sy/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Your Cart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 items',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, i) => CartWidget(
                id: cartProvider.items.values.toList()[i].id,
                itemId: cartProvider.items.keys.toList()[i],
                title: cartProvider.items.values.toList()[i].title,
                price: cartProvider.items.values.toList()[i].price,
                imageUrl: cartProvider.items.values.toList()[i].imageUrl,
                quantity: cartProvider.items.values.toList()[i].quantity,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
