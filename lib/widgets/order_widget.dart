import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/models/order/order_model.dart';

import '../providers/order_provider.dart' as ord;

class OrderWidget extends StatefulWidget {
  final OrderModel order;

  OrderWidget(this.order);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: RichText(
              text: TextSpan(
                text: NumberFormat().format(widget.order.total),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18.sp,
                    fontFamily: 'AnekMalayalam',
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' SYP',
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AnekMalayalam',
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              // DateFormat('dd/MM/yyyy hh:mm')
              //     .format(DateTime.parse(widget.order.createdAt)),
              'sssss',
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.product.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                            Text(
                              '${prod.quantity} x ${NumberFormat().format(prod.product.price)}',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.grey),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
