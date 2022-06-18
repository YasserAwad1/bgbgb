import 'package:flutter/material.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? productId = routeArgs['productId'];

    final loadedProduct = Provider.of<ProductProvider>(context, listen: true)
        .findById(productId!);

    final cartProvider = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      loadedProduct.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 45,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 8,
                    ),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${loadedProduct.rating}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber[500],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            loadedProduct.imageUrl,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      loadedProduct.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${loadedProduct.price} SYP',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                loadedProduct.description,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[350]),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // loadedProduct.toggleFavoriteStatus(loadedProduct);
                        });
                      },
                      icon: Icon(Icons.favorite_border_rounded),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  // decoration: BoxDecoration(
                  //     color: Theme.of(context).colorScheme.secondary,
                  //     borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 310,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                       backgroundColor: Theme.of(context).colorScheme.primary,
                       
                       
                      ),
                      onPressed: () {
                        cartProvider.addItem(loadedProduct.id, loadedProduct.title,
                            loadedProduct.price, loadedProduct.imageUrl);
                      },
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
