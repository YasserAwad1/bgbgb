import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../providers/address_provider.dart';
import '../../../../providers/cart_provider.dart';

class CheckoutDialogContent extends StatelessWidget {
  const CheckoutDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SizedBox(
      height: 140.h,
      width: 400.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // YOUR TOTAL IS, IT WILL BE SHIPPED TO THE FOLLOWING ADDRESS
          Text(
              '${AppLocalizations.of(context)!.yourTotalIs} ${NumberFormat().format(cart.getCartTotal())}, ${AppLocalizations.of(context)!.itWill}'),
          if (Provider.of<AddressProvider>(context).selectedAddress != null)
            RichText(
              text: TextSpan(
                  text: AppLocalizations.of(context)!.street,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                  children: [
                    TextSpan(
                        text: Provider.of<AddressProvider>(context)
                                    .selectedAddress ==
                                null
                            ? "Please Select a location"
                            : Provider.of<AddressProvider>(context)
                                .selectedAddress!
                                .street,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary)),
                  ]),
            ),
          if (Provider.of<AddressProvider>(context).selectedAddress != null)
            RichText(
              text: TextSpan(
                  // BUILDING NUMBER
                  text: AppLocalizations.of(context)!.bn,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                  children: [
                    TextSpan(
                        text: Provider.of<AddressProvider>(context)
                            .selectedAddress!
                            .buildingNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary)),
                  ]),
            ),
          if (Provider.of<AddressProvider>(context).selectedAddress != null)
            RichText(
              text: TextSpan(
                  // FLOOR
                  text: AppLocalizations.of(context)!.floor,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                  children: [
                    TextSpan(
                        text: Provider.of<AddressProvider>(context)
                            .selectedAddress!
                            .floor,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary)),
                  ]),
            ),
          if (Provider.of<AddressProvider>(context).selectedAddress != null)
            RichText(
              text: TextSpan(
                // details
                text: AppLocalizations.of(context)!.details,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
                children: [
                  TextSpan(
                    text: Provider.of<AddressProvider>(context)
                        .selectedAddress!
                        .description,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
