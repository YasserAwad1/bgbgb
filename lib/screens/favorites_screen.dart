import 'package:flutter/material.dart';
import 'package:kay_sy/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';

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
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Text(
                      "Your Favorites ",
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
            favoriteProducts.isEmpty
                ? SizedBox(
                    height: 500.h,
                    child: Center(
                      child: Text(
                        'No favorites yet, start adding some!',
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
                            leading: Container(
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
                                    cart.addItem(
                                      favoriteProducts[i].id,
                                      favoriteProducts[i].title,
                                      favoriteProducts[i].price,
                                      favoriteProducts[i].imageUrls[0],
                                    );
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
