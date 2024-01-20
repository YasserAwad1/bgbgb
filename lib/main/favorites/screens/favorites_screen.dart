import 'package:flutter/material.dart';
import 'package:kay_sy/main/favorites/widgets/FavoritesTopBar.dart';
import 'package:kay_sy/main/favorites/widgets/FavroiteProductsGrid.dart';

import 'package:kay_sy/providers/language_provider.dart';

import 'package:kay_sy/widgets/custom_product/custom_product_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_provider.dart';

import '../../products/screens/product_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites-screen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        Provider.of<ProductProvider>(context).favoriteItems;

    var isArabic = Provider.of<LanguageProvider>(context).isArabic();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FavoritesTopBar(isArabic: isArabic),
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
                //FAVORITE PRODUCTS GRID
                : Expanded(
                    child: FavoriteProductsGrid(
                    favoriteProducts: favoriteProducts,
                  )),
          ],
        ),
      ),
    );
  }
}
