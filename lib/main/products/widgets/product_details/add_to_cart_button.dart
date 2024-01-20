import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../models/product/product.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../common/widgets/custom_button.dart';

class AddToCartButton extends StatefulWidget {
  Product loadedProduct;
  AddToCartButton({ required this.loadedProduct});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return Flexible(
      child: cartProvider.isItemInCart(widget.loadedProduct.id)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          cartProvider.decreaseQuantity(widget.loadedProduct);
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  Text(
                    '${cartProvider.itemQuantity(widget.loadedProduct.id)}',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          cartProvider.addItem(
                            widget.loadedProduct,
                          );
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                ],
              ),
            )
          : Container(
              margin: const EdgeInsets.all(10),
              height: 50.h,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomButton(
                      text: "Add to cart",
                      width: 200.w,
                      height: 50.h,
                      onTap: () {
                        setState(() async {
                          await cartProvider.addItem(
                            widget.loadedProduct,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(cartProvider.message)));

                          print(cartProvider.items);
                        });
                      })),
            ),
    );
  }
}
