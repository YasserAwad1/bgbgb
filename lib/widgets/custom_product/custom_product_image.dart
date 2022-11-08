import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kay_sy/models/product/product.dart';

class CustomProductImage extends StatelessWidget {
  final Product loadedProduct;

  const CustomProductImage({super.key, required this.loadedProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 200.h,
      width: double.infinity,
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        children: List.generate(
            loadedProduct.custom!.chosenProducts.length,
            (index) => Image.network(
                  loadedProduct.custom!.chosenProducts[index].imageUrls[0],
                  height: 100.h,
                )),
        // scatter them randomly
      ),
    );
  }
}
