import 'package:flutter/material.dart';
import 'package:kay_sy/providers/language_provider.dart';

import 'package:kay_sy/widgets/custom_product/custom_product_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';
import 'product_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites-screen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProducts =
        Provider.of<ProductProvider>(context).favoriteItems;
    final cart = Provider.of<CartProvider>(context);
    var snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: const Duration(seconds: 2),
      content: const Text(
        'Item added successfully!',
      ),
    );

    var isArabic = Provider.of<LanguageProvider>(context).isArabic();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topRight:
                              isArabic ? Radius.zero : Radius.circular(15.sp),
                          bottomRight:
                              isArabic ? Radius.zero : Radius.circular(15.sp),
                          topLeft:
                              isArabic ? Radius.circular(15.sp) : Radius.zero,
                          bottomLeft:
                              isArabic ? Radius.circular(15.sp) : Radius.zero,
                        )),
                    // YOUR FAVORITES
                    child: Text(
                      AppLocalizations.of(context)!.yourfav,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
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
            // NO FAVORITES YET START ADDING SOME
            favoriteProducts.isEmpty
                ? SizedBox(
                    height: 500.h,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_favs,
                        style: TextStyle(
                            fontFamily: "AnekMalayalam", fontSize: 20.sp),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: favoriteProducts.length,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          shadowColor: Theme.of(context).colorScheme.secondary,
                          elevation: 3,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProductDetailsScreen.routeName,
                                  arguments: favoriteProducts[i].id);
                            },
                            contentPadding: const EdgeInsets.all(5),
                            leading: favoriteProducts[i].custom != null
                                ? SizedBox(
                                    width: 50.w,
                                    child: CustomProductImage(
                                        loadedProduct: favoriteProducts[i]),
                                  )
                                : Container(
                                    margin: EdgeInsets.all(5.w),
                                    decoration: BoxDecoration(boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 7,
                                          offset: Offset(6, 6))
                                    ], color: Colors.grey[300]),
                                    child: Image.network(
                                      favoriteProducts[i].imageUrls[0],
                                    ),
                                  ),
                            title: Text(
                              favoriteProducts[i].title,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18.sp),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cart.addItem(favoriteProducts[i]);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      productProvider.toggleFavoriteStatus(
                                          favoriteProducts[i]);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                  ),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
