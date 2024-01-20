import 'package:flutter/material.dart';
import 'package:kay_sy/models/product/product.dart';
import 'package:provider/provider.dart';

import '../../../../providers/product_provider.dart';

class PdTopBar extends StatefulWidget {
  Product loadedProduct;
  PdTopBar({required this.loadedProduct});

  @override
  State<PdTopBar> createState() => _PdTopBarState();
}

class _PdTopBarState extends State<PdTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 45,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        const Text(
          'Details',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 45,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              setState(() {
                Provider.of<ProductProvider>(context, listen: false)
                    .toggleFavoriteStatus(widget.loadedProduct);
              });
            },
            icon: Icon(
              widget.loadedProduct.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: widget.loadedProduct.isFavorite
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
