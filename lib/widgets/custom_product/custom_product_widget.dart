import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/models/product/product.dart';

import '../../constants.dart';

class CustomProductWidget extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  bool isSelected;
  CustomProductWidget({
    required this.product,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<CustomProductWidget> createState() => _CustomProductWidgetState();
}

class _CustomProductWidgetState extends State<CustomProductWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
          color: widget.isSelected
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
          width: 4,
        )),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              child: CarouselSlider.builder(
                itemBuilder: (ctx, i, e) => Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  margin: const EdgeInsets.all(2),
                  width: 320.w,
                  child: Image.network(
                    "${Constants.baseUrl}/${widget.product.imageUrls[i]}",
                  ),
                ),
                itemCount: widget.product.imageUrls.length,
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    currentIndex = index;
                    setState(() {});
                  },
                  autoPlay: false,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //dots for carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.product.imageUrls.length,
                (index) => Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentIndex ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "${NumberFormat().format(widget.product.price)} SYP",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}
