import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/product_provider.dart';
import 'popular_product_widget.dart';

class TrendingProductsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
   
    return CarouselSlider.builder(
      itemCount: productProvider.trendingProducts.length,
      itemBuilder: (context, index, e) {
        return PopularProductWidget(
            id: productProvider.trendingProducts[index].id,
            title: productProvider.trendingProducts[index].title,
            imageUrl: productProvider.trendingProducts[index].imageUrls[0],
            description: productProvider.trendingProducts[index].description,
            price: productProvider.trendingProducts[index].price,
            index: index);
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        height: 200.h,
        viewportFraction: 0.5,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        clipBehavior: Clip.none,
      ),
    );
  }
}
