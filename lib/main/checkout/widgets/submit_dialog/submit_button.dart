import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/screens/first_screen.dart';
import '../../../../providers/address_provider.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/order_provider.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return TextButton(
        onPressed: () async {
          final success =
              await Provider.of<OrderProvider>(context, listen: false).addOrder(
                  Provider.of<AddressProvider>(context, listen: false)
                      .selectedAddress!
                      .id,
                  cart.getCartTotal(),
                  2000);
          //remove all screens and navigate
          // to home screen
          if (success) {
            Navigator.of(context).restorablePushNamedAndRemoveUntil(
                FirstScreen.routeName, (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppLocalizations.of(context)!.orderSubmitted),
              duration: const Duration(seconds: 5),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(Provider.of<OrderProvider>(context).message),
              duration: const Duration(seconds: 5),
            ));
          }
        },
        child: Text(
          AppLocalizations.of(context)!.submit,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ));
  }
}
