import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/badge.dart';
import 'package:kay_sy/widgets/search_bar.dart';

import '../providers/cart_provider.dart';

import '../screens/cart_screen.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // WHAT ARE YOU LOOKING FOR 
              Text(
                AppLocalizations.of(context)!.searchqu,
                style: TextStyle(fontFamily: 'AnekMalayalam', fontSize: 25.sp, color: Theme.of(context).colorScheme.primary),
              ),
              Consumer<CartProvider>(
                builder: (_, cart, ch) => Badge(
                    child: ch!,
                    value: cart.itemCount.toString(),
                    color: Theme.of(context).colorScheme.secondary),
                child: IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(CartScreen.routeName),
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SearchBar(),
      ],
    ));
  }
}
