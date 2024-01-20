import 'package:flutter/material.dart';
import 'package:kay_sy/models/product/product.dart';
import 'package:provider/provider.dart';

import '../../../../providers/product_provider.dart';
import '../../../../widgets/custom_product/custom_product_widget.dart';

class CustomProductGrid extends StatelessWidget {
  Product loadedProduct;
  CustomProductGrid({
    required this.loadedProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemCount: loadedProduct.custom!.products.length,
        itemBuilder: (context, index) {
          return CustomProductWidget(
              isSelected: Provider.of<ProductProvider>(context).childIsSelected(
                  loadedProduct, loadedProduct.custom!.products[index]),
              product: loadedProduct.custom!.products[index],
              onTap: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .tapOnCustomProduct(
                        loadedProduct, loadedProduct.custom!.products[index]);
              });
        });
  }
}
