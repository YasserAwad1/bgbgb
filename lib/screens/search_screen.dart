import 'package:flutter/material.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:kay_sy/widgets/product_widget.dart';

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
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // WHAT ARE YOU LOOKING FOR
                Text(
                  AppLocalizations.of(context)!.searchqu,
                  style: TextStyle(
                      fontFamily: 'AnekMalayalam',
                      fontSize: 25.sp,
                      color: Theme.of(context).colorScheme.primary),
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
          SearchBar(
            onChanged: (p0) {
              Provider.of<ProductProvider>(context, listen: false)
                  .getProductsBySearch(p0);
            },
          ),
          Provider.of<ProductProvider>(context).isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Provider.of<ProductProvider>(context)
                      .searchProducts
                      .length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7.sp,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      product: Provider.of<ProductProvider>(context)
                          .searchProducts[index],
                    );
                  })
        ],
      ),
    ));
  }
}
