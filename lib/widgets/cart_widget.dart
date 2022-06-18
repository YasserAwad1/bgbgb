import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  Text('${price} x${quantity}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
