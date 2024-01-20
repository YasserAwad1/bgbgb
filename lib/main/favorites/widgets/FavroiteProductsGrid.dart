import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_provider.dart';
import '../../products/screens/product_details_screen.dart';
import '../../../widgets/custom_product/custom_product_image.dart';

class FavoriteProductsGrid extends StatefulWidget {
  var favoriteProducts;
  FavoriteProductsGrid({super.key, required this.favoriteProducts});

  @override
  State<FavoriteProductsGrid> createState() => _FavoriteProductsGridState();
}

class _FavoriteProductsGridState extends State<FavoriteProductsGrid> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cart = Provider.of<CartProvider>(context);

    var snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: const Duration(seconds: 2),
      content: const Text(
        'Item added successfully!',
      ),
    );

    return ListView.builder(
      itemCount: widget.favoriteProducts.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(7.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Theme.of(context).colorScheme.secondary,
          elevation: 3,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                  arguments: widget.favoriteProducts[i].id);
            },
            contentPadding: const EdgeInsets.all(5),
            leading: widget.favoriteProducts[i].custom != null
                ? SizedBox(
                    width: 50.w,
                    child: CustomProductImage(
                        loadedProduct: widget.favoriteProducts[i]),
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
                      widget.favoriteProducts[i].imageUrls[0],
                    ),
                  ),
            title: Text(
              widget.favoriteProducts[i].title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18.sp),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    cart.addItem(widget.favoriteProducts[i]);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      productProvider
                          .toggleFavoriteStatus(widget.favoriteProducts[i]);
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
    );
  }
}
