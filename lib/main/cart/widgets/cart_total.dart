import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/cart_provider.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
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
                text: NumberFormat().format(cartProvider.getCartTotal()),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18.sp,
                    fontFamily: 'AnekMalayalam',
                    fontWeight: FontWeight.bold),
                children: [
                  // SYP
                  TextSpan(
                    text: ' ${AppLocalizations.of(context)!.currency}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.secondary,
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
    );
  }
}
