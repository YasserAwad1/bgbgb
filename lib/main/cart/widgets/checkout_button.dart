import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/cart_provider.dart';
import '../../checkout/screens/checkOut_screen.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              // YOUR CART IS EMPTY
              cartProvider.items.isEmpty
                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(AppLocalizations.of(context)!.emptyCart),
                      backgroundColor: Theme.of(context).errorColor,
                    ))
                  : Navigator.of(context).pushNamed(CheckOutScreen.routeName);
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
    );
  }
}
