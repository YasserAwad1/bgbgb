import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/cart_provider.dart';
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, i) => Column(
                children: [
                  CartWidget(
                    id: cartProvider.items.values.toList()[i].id,
                    itemId: cartProvider.items.keys.toList()[i],
                    title: cartProvider.items.values.toList()[i].title,
                    price: cartProvider.items.values.toList()[i].price,
                    imageUrl: cartProvider.items.values.toList()[i].imageUrl,
                    quantity: cartProvider.items.values.toList()[i].quantity,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text:
                          'Total:${NumberFormat().format(cartProvider.cartTotal)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontFamily: 'AnekMalayalam',
                      ),
                      children: [
                        TextSpan(
                          text: 'SYP',
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AnekMalayalam',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontFamily: 'AnekMalayalam',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: Row(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       height: 50,
          //       width: double.infinity,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(10),
          //         child: TextButton(
          //           style: TextButton.styleFrom(
          //             backgroundColor: Theme.of(context).colorScheme.primary,
          //           ),
          //           onPressed: () {},
          //           child: const Center(
          //             child: Text(
          //               'Order Now',
          //               style: TextStyle(fontSize: 20, color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
