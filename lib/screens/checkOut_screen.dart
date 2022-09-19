import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:kay_sy/providers/order_provider.dart';
import 'package:kay_sy/screens/add_address_screen.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:provider/provider.dart';
import '../models/address_model.dart';

import '../providers/cart_provider.dart';
import '../providers/address_provider.dart';

class CheckOutScreen extends StatefulWidget {
  static const routeName = '/checkOutScreen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final addressList = Provider.of<AddressProvider>(context).addresses;
    var shipping;
    var firstLocation = addressList.first;

    void changeLocation(AddressModel newAddress) {
      setState(() {
        firstLocation = newAddress;
      });
    }

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
                  // YOUR ORDER
                  Text(
                    AppLocalizations.of(context)!.yourOrder,
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
                                Text(AppLocalizations.of(context)!.total,
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
              height: 230.h,
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
                          // CART TOTAL
                          text: TextSpan(
                              text: '${AppLocalizations.of(context)!.cartTotal}: ',
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
                                // SYP
                                TextSpan(
                                    text:
                                        ' ${AppLocalizations.of(context)!.currency}',
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
                        //DISCOUNT
                        RichText(
                          text: TextSpan(
                              text: AppLocalizations.of(context)!.discount,
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
                                    text:
                                        ' ${AppLocalizations.of(context)!.currency}',
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
                          AppLocalizations.of(context)!.shipping,
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
                              text: AppLocalizations.of(context)!.totalPrice,
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
                                    text:
                                        ' ${AppLocalizations.of(context)!.currency}',
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
                  addressList.isEmpty
                      ? showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              'You haven\'t added a shipping address !',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content:
                                const Text('Please add an address to continue'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .restorablePopAndPushNamed(
                                            AddAddressScreen.routeName);
                                  },
                                  child: Text(
                                    'add address',
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
                          ),
                        )
                      : showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Provider.of<OrderProvider>(context,
                                                listen: false)
                                            .addOrder(
                                                cart.items.values.toList(),
                                                cart.cartTotal.toDouble());
                                        cart.clearCart();
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                FirstScreen.routeName);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(AppLocalizations.of(context)!.orderSubmitted),
                                          duration: const Duration(seconds: 5),
                                        ));
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.submit,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => SimpleDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                    titlePadding:
                                                        EdgeInsets.only(
                                                            left: 8.sp,
                                                            top: 5.sp),
                                                    title: Text(
                                                      // CHOOSE AN ADDRESS
                                                      AppLocalizations.of(
                                                              context)!
                                                          .chooseAddress,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    children: [
                                                      Container(
                                                        height: 250.h,
                                                        width: 300.w,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: addressList
                                                              .length,
                                                          itemBuilder:
                                                              (context, i) =>
                                                                  Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.sp),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                changeLocation(
                                                                    addressList[
                                                                        i]);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Card(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  RichText(
                                                                    text: TextSpan(
                                                                        // STREET
                                                                        text: AppLocalizations.of(context)!.street,
                                                                        style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: addressList[i].street,
                                                                              style: TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.primary)),
                                                                        ]),
                                                                  ),
                                                                  RichText(
                                                                    // BUILDING NUMBER
                                                                    text: TextSpan(
                                                                        text: AppLocalizations.of(context)!
                                                                            .bn,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Theme.of(context).colorScheme.secondary),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: addressList[i].buildingNumber,
                                                                              style: TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.primary)),
                                                                        ]),
                                                                  ),
                                                                  RichText(
                                                                    // FLOOR
                                                                    text: TextSpan(
                                                                        text: AppLocalizations.of(context)!
                                                                            .floor,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Theme.of(context).colorScheme.secondary),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: addressList[i].floor,
                                                                              style: TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.primary)),
                                                                        ]),
                                                                  ),
                                                                  RichText(
                                                                    // DETAILS
                                                                    text: TextSpan(
                                                                        text: AppLocalizations.of(context)!
                                                                            .details,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Theme.of(context).colorScheme.secondary),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: addressList[i].description,
                                                                              style: TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.primary)),
                                                                        ]),
                                                                  ),
                                                                ],
                                                              )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]));
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .changeLocation,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.cancel))
                                ],
                                title: Text(
                                  // ARE YOU SURE YOU WANT TO SUBMIT THIS ORDER
                                  AppLocalizations.of(context)!.submitOrder,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                content: SizedBox(
                                  height: 140.h,
                                  width: 400.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // YOUR TOTAL IS, IT WILL BE SHIPPED TO THE FOLLOWING ADDRESS
                                      Text(
                                          '${AppLocalizations.of(context)!.yourTotalIs} ${NumberFormat().format(cart.cartTotal)}, ${AppLocalizations.of(context)!.itWill}'),
                                      RichText(
                                        text: TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .street,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            children: [
                                              TextSpan(
                                                  text: firstLocation.street,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary)),
                                            ]),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            // BUILDING NUMBER
                                            text: AppLocalizations.of(context)!
                                                .bn,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            children: [
                                              TextSpan(
                                                  text: firstLocation
                                                      .buildingNumber,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary)),
                                            ]),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            // FLOOR
                                            text: AppLocalizations.of(context)!
                                                .floor,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            children: [
                                              TextSpan(
                                                  text: firstLocation.floor,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary)),
                                            ]),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            // details
                                            text: AppLocalizations.of(context)!
                                                .details,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      firstLocation.description,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
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
                    AppLocalizations.of(context)!.orderNow,
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
