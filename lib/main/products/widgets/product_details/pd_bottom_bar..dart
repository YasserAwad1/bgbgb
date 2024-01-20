import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/main/products/widgets/product_details/add_to_cart_button.dart';
import 'package:kay_sy/models/product/product.dart';


class PdBottomBar extends StatefulWidget {
  Product loadedProduct;
  int total;
  PdBottomBar({required this.loadedProduct, required this.total});

  @override
  State<PdBottomBar> createState() => _PdBottomBarState();
}

class _PdBottomBarState extends State<PdBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //PRICE WIDGET
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  text: NumberFormat().format(
                      widget.loadedProduct.custom != null
                          ? widget.total
                          : widget.loadedProduct.price),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                  children: [
                    TextSpan(
                      text: 'SYP',
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //ADD TO CART BUTTON
          AddToCartButton(
            loadedProduct: widget.loadedProduct,
          )
        ],
      ),
    );
  }
}
