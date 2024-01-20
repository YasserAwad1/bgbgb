import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product/product.dart';

import '../../../../constants.dart';

class SmallImages extends StatefulWidget {
  Product loadedProduct;
  int currentIndex;
  CarouselController controller;

  SmallImages({
    required this.loadedProduct,
    required this.currentIndex,
    required this.controller,
  });

  @override
  State<SmallImages> createState() => _SmallImagesState();
}

class _SmallImagesState extends State<SmallImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.loadedProduct.imageUrls.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(i);
                    widget.currentIndex = i;
                  });
                },
                child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: widget.currentIndex == i
                            ? Colors.red
                            : Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "${Constants.baseUrl}/${widget.loadedProduct.imageUrls[i]}",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
