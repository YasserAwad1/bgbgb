import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/language_provider.dart';

class CartTopBar extends StatelessWidget {
  const CartTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
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
          SizedBox(
            width: 100.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // YOUR CART
              Text(
                AppLocalizations.of(context)!.yourCart,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${cartProvider.itemCount} ${AppLocalizations.of(context)!.items}',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
