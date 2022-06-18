import 'package:flutter/material.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../screens/product_details_screen.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductWidget extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final String description;
  final int index;

  ProductWidget({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.index,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    // final listOfProducts =
    //     Provider.of<ProductProvider>(context, listen: true).products;
  
    return GestureDetector(
      onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailsScreen.routeName, arguments: {
                  'productId': widget.id,
                  'productName': widget.title,
                });
              },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //image
            Container(
              //height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  widget.imageUrl,
                  height: 130,
      
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              
              padding: EdgeInsets.only(
                left: 10
              ),
              decoration: BoxDecoration(
                //color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    '${widget.price} SYP',
                    style:  TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // listOfProducts[widget.index].toggleFavoriteStatus(listOfProducts[widget.index]);
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
