import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/models/product.dart';

class CustomProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  bool isSelected;
  CustomProductWidget({
    required this.product,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 37.sp,
            backgroundColor: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey[300],
            child: CircleAvatar(
              radius: 35.sp,
              backgroundColor: Colors.grey[400],
              backgroundImage: NetworkImage(product.imageUrls[0]),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "${NumberFormat().format(product.price)} SYP",
          style: TextStyle(
              fontSize: 13.sp, color: Theme.of(context).colorScheme.secondary),
        )
      ],
    );
  }
}
