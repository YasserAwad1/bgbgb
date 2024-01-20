import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product/product.dart';

class ProductInformation extends StatelessWidget {
  Product loadedProduct;
  ProductInformation({
    required this.loadedProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: const Alignment(-0.9, 1),
          child: Text(
            'INFORMATION',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Text(
            loadedProduct.description,
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
