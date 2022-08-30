import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/models/product.dart';

import 'package:kay_sy/screens/product_details_screen.dart';
import 'package:kay_sy/widgets/custom_product/custom_product_image.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  ProductWidget({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat('#,###,000').format(product.price);

    // final p = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: product.id,
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5.w),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 15, offset: Offset(6, 6))
            ], color: Colors.grey[300]),
            child: Image.network(
              product.imageUrls[0],
              frameBuilder: (_, image, loadingBuilder, __) {
                if (loadingBuilder == null) {
                  return SizedBox(
                    height: 150.h,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return image;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$price SYP",
                style: TextStyle(fontSize: 15.sp),
              ),
              Consumer<ProductProvider>(builder: (context, p, _) {
                return IconButton(
                    onPressed: () {
                      p.toggleFavoriteStatus(product);
                    },
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: product.isFavorite
                          ? Colors.red
                          : Theme.of(context).colorScheme.primary,
                    ));
              })
            ],
          ),
        ],
      ),
    );
  }
}
