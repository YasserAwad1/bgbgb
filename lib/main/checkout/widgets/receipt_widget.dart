import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/cart_provider.dart';

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var shipping;
    final cart = Provider.of<CartProvider>(context);

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

    return Container(
      color: Colors.transparent,
      height: 230.h,
      width: 250.w,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 40,
        shadowColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                          color: Theme.of(context).colorScheme.secondary),
                      children: [
                        TextSpan(
                            text: NumberFormat().format(cart.getCartTotal()),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.primary)),
                        // SYP
                        TextSpan(
                            text: ' ${AppLocalizations.of(context)!.currency}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary))
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
                          color: Theme.of(context).colorScheme.secondary),
                      children: [
                        TextSpan(
                            text: '0',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.primary)),
                        TextSpan(
                            text: ' ${AppLocalizations.of(context)!.currency}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary))
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
                CustomRadioButton('Normal shipping (2-3 days)\n 2000 SYP'),
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
                          color: Theme.of(context).colorScheme.secondary),
                      children: [
                        TextSpan(
                            text: NumberFormat().format(1952000),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.primary)),
                        TextSpan(
                            text: ' ${AppLocalizations.of(context)!.currency}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary))
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
