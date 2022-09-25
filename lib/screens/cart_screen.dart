import 'package:flutter/material.dart';
import 'package:kay_sy/providers/language_provider.dart';
import 'package:kay_sy/screens/checkOut_screen.dart';
import 'package:kay_sy/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  static const routeName = 'cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final _future;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _future =
              Provider.of<CartProvider>(context, listen: false).getCartItems()
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(isArabic
                                  ? Icons.arrow_back_ios_outlined
                                  : Icons.arrow_back_ios_new_rounded),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // YOUR CART
                                Text(
                                  AppLocalizations.of(context)!.yourCart,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${cartProvider.itemCount} ${AppLocalizations.of(context)!.items}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
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
                          }),
                    ],
                  );
                }),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: FittedBox(
                      child: Column(
                        children: [
                          // TOTAL
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontFamily: 'AnekMalayalam',
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),
                          RichText(
                            text: TextSpan(
                              text: NumberFormat()
                                  .format(cartProvider.getCartTotal()),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18.sp,
                                  fontFamily: 'AnekMalayalam',
                                  fontWeight: FontWeight.bold),
                              children: [
                                // SYP
                                TextSpan(
                                  text:
                                      ' ${AppLocalizations.of(context)!.currency}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'AnekMalayalam',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            // YOUR CART IS EMPTY
                            cartProvider.items.isEmpty
                                ? ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(AppLocalizations.of(context)!
                                        .emptyCart),
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  ))
                                : Navigator.of(context)
                                    .pushNamed(CheckOutScreen.routeName);
                          },
                          // CHECKOUT
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.checkout,
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
            ),
          ),
        ),
        if (Provider.of<CartProvider>(context).isLoading) Loader()
      ],
    );
  }
}
