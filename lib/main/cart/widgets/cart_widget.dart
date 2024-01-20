import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/product/product.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class CartWidget extends StatefulWidget {
  final String id;

  final int quantity;
  final Product product;

  CartWidget({required this.id, required this.product, required this.quantity});

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
                  "${Constants.baseUrl}/${widget.product.imageUrls[0]}",
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
                    widget.product.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "AnekMalayalam",
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: NumberFormat().format(widget.product.price),
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                      children: [
                        TextSpan(
                          // SYP
                          text: ' ${AppLocalizations.of(context)!.currency}',
                          style: TextStyle(
                            color: Colors.grey[600],
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
                      text: '${AppLocalizations.of(context)!.total}: ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15.sp,
                        fontFamily: 'AnekMalayalam',
                      ),
                      children: [
                        TextSpan(
                            text: NumberFormat().format(
                                Provider.of<CartProvider>(context)
                                    .itemTotal(widget.id)),
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                          // syp
                          text: ' ${AppLocalizations.of(context)!.currency}',
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
                            .addItem(widget.product);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      '${Provider.of<CartProvider>(context).itemQuantity(widget.product.id)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'AnekMalayalam',
                      ),
                    ),
                    //remove button
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .decreaseQuantity(widget.product);
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
