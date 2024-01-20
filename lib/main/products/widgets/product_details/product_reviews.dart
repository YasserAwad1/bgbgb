import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product/product.dart';

import 'review_widget.dart';

class ProductReviews extends StatelessWidget {
  Product loadedProduct;
  ProductReviews({
    required this.loadedProduct,
  });

  @override
  Widget build(BuildContext context) {
    return loadedProduct.reviews!.isEmpty
        ? Center(
            child: SizedBox(
              width: 150.w,
              child: Text(
                "NO REVIEWS FOR THIS PRODUCT....",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: loadedProduct.reviews!.length,
              itemBuilder: (ctx, i) => ReviewWidget(
                review: loadedProduct.reviews![i],
              ),
            ),
          );
  }
}
