import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/providers/order_provider.dart';
import 'package:kay_sy/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/address_provider.dart';

class CheckOutScreen extends StatelessWidget {
  static const routeName = '/checkOutScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final addressList = Provider.of<AddressProvider>(context).addresses.first;
    var shipping;

    Row CustomRadioButton(String text) {
      return Row(
        children: [
          Radio(
            activeColor: Theme.of(context).colorScheme.secondary,
            groupValue: shipping,
            onChanged: (value) {},
            value: text,
          ),
          Text(text)
        ],
      );
    }

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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Your order',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) => Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: 50.h,
                              width: 50.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  cart.items.values.toList()[i].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(cart.items.values.toList()[i].title),
                            subtitle: Text(
                              '${cart.items.values.toList()[i].quantity.toString()} X',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                            trailing: Column(
                              children: [
                                Text('Total:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                Text(NumberFormat()
                                    .format(cart.itemTotal(
                                        cart.items.values.toList()[i].id))
                                    .toString())
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 0.45,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      )),
            ),
            // Center(
            //   child: Text('${cart.itemCount} Items'),
            // ),
            Container(
              color: Colors.transparent,
              height: 235.h,
              width: 250.w,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 40,
                shadowColor: Theme.of(context).colorScheme.secondary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Cart Total: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              children: [
                                TextSpan(
                                    text: NumberFormat().format(cart.cartTotal),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                TextSpan(
                                    text: ' SYP',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                              ]),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Discount: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              children: [
                                TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                TextSpan(
                                    text: ' SYP',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                              ]),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Text(
                          'Shipping: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        CustomRadioButton(
                            'Normal shipping (2-3 days)\n 2000 SYP'),
                        CustomRadioButton(
                            'Fast shipping (during 24 hours) \n 4000 SYP'),
                        const Divider(
                          thickness: 1,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Total: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              children: [
                                TextSpan(
                                    text: NumberFormat().format(1952000),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                TextSpan(
                                    text: ' SYP',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Provider.of<OrderProvider>(context, listen: false)
                                        .addOrder(cart.items.values.toList(),
                                            cart.cartTotal.toDouble());
                                    cart.clearCart();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'))
                            ],
                            title: const Text(
                                'Are you sure you want to submit this order ?'),
                            content: SizedBox(
                              height: 120.h,
                              width: 400.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Your total is ${cart.cartTotal}, it will be shipped to the following address:'),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Street: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        children: [
                                          TextSpan(
                                              text: addressList.street,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Building number: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        children: [
                                          TextSpan(
                                              text: addressList.buildingNumber,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Floor: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        children: [
                                          TextSpan(
                                              text: addressList.floor,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Description: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        children: [
                                          TextSpan(
                                              text: addressList.description,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                child: Center(
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontFamily: 'AnekMalayalam',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}