import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../providers/product_provider.dart';
import 'product_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Provider.of<ProductProvider>(context).products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7.sp,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return ProductWidget(
          product: Provider.of<ProductProvider>(context).products[index],
        );
      },
    );
  }
}
