import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartWidget extends StatefulWidget {
  final String id;
  final String itemId;
  final String title;
  final int price;
  final int quantity;
  final String imageUrl;

  CartWidget(
      {required this.id,
      required this.itemId,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.quantity});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.h,
        width: double.infinity,
        child: Row(
          children: [
            //image
            Container(
              height: 100.h,
              width: 100.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ), //title
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "AnekMalayalam",
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '${NumberFormat().format(widget.price)}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.sp),
                      children: [
                        TextSpan(
                          text: ' SYP',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontFamily: 'AnekMalayalam',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  //total
                  RichText(
                    text: TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15.sp,
                        fontFamily: 'AnekMalayalam',
                      ),
                      children: [
                        TextSpan(
                            text:
                                "${Provider.of<CartProvider>(context).itemTotal(widget.id)}",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                          text: ' SYP',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontFamily: 'AnekMalayalam',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[350]),
              height: 100.h,
              width: 40.w,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //add button
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addQuantity(widget.id);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      '${Provider.of<CartProvider>(context).itemQuantity(widget.id)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'AnekMalayalam',
                      ),
                    ),
                    //remove button
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .decreaseQuantity(widget.id);
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
