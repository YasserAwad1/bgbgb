import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product/product.dart';

import '../../../../constants.dart';

class ImagesCarousel extends StatefulWidget {
  Product loadedProduct;
  CarouselController controller;
  int currentIndex;
  ImagesCarousel({
    required this.loadedProduct,
    required this.controller,
    required this.currentIndex,
  });

  @override
  State<ImagesCarousel> createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: CarouselSlider.builder(
        carouselController: widget.controller,
        itemBuilder: (ctx, i, e) => Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 6,
          shadowColor: Theme.of(context).colorScheme.secondary,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            margin: const EdgeInsets.all(2),
            width: 320.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "${Constants.baseUrl}/${widget.loadedProduct.imageUrls[i]}",
              ),
            ),
          ),
        ),
        itemCount: widget.loadedProduct.imageUrls.length,
        options: CarouselOptions(
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          autoPlay: false,
        ),
      ),
    );
  }
}
