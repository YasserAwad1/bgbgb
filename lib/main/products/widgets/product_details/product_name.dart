import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product/product.dart';

class ProductName extends StatelessWidget {
  Product loadedProduct;
  ProductName({
    required this.loadedProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.9, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loadedProduct.title,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
