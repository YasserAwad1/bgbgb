import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/rating_star_widget.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TOP APP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
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
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ),
                ],
              ),
              //CAROUSEL SLIDER
              SizedBox(
                height: 250,
                child: CarouselSlider.builder(
                  itemBuilder: (ctx, i, e) => Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 6,
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      margin: const EdgeInsets.all(2),
                      width: 320,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          loadedProduct.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  itemCount: 3,
                  options: CarouselOptions(
                    autoPlay: false,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //SMALL IMAGES
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
              //CATEGORY
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('category'),
                    // TITLE AND RATING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loadedProduct.title,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            right: 8,
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${loadedProduct.rating}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                      ],
                    ),
                    //DESCRIPTON
                    Text(
                      'Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      loadedProduct.description,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                    Divider(
                      thickness: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              //REVIEWS
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'userName',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: 4),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: StarRating(
                              onRatingChanged: ((rating) => setState(() {
                                    loadedProduct.rating = rating;
                                  })),
                              color: Colors.amber,
                              rating: loadedProduct.rating,
                            ),
                          ),
                          Spacer(),
                          Text(
                            DateFormat('dd/MM/yyyy').format(
                              DateTime.now(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(loadedProduct.comments),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ListView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: 3,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         shrinkWrap: true,
                      //         // gridDelegate:
                      //         //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //         //         crossAxisCount: 1),
                      //         itemBuilder: (ctx, i) => Container(
                      //           height: 50,
                      //           width: 50,
                      //           child: Image.network(
                      //             loadedProduct.imageUrl,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Divider(),
                    ],
                  ),
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [
              //       ListView.builder(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount: 5,
              //         itemBuilder: (ctx, i) => Card(
              //           color: Colors.grey[300],
              //           child: ListTile(
              //               title: Text(
              //                 'username',
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //               subtitle: Padding(
              //                 padding: const EdgeInsets.all(2.0),
              //                 child: Text(
              //                   loadedProduct.comments,
              //                   maxLines: 3,
              //                 ),
              //               ),
              //               trailing: FittedBox(
              //                 fit: BoxFit.scaleDown,
              //                 child: StarRating(
              //                   onRatingChanged: ((rating) => setState(() {
              //                         loadedProduct.rating = rating;
              //                       })),
              //                   color: Colors.amber,
              //                   rating: loadedProduct.rating,
              //                 ),
              //               )
              //               // Container(
              //               //   width: 60,
              //               //   decoration: BoxDecoration(
              //               //       color: Colors.grey[200],
              //               //       borderRadius: BorderRadius.circular(15)),
              //               //   child: Padding(
              //               //     padding: const EdgeInsets.all(5.0),
              //               //     child: Row(
              //               //       mainAxisAlignment:
              //               //           MainAxisAlignment.spaceAround,
              //               //       children: [
              //               //         Text(
              //               //           '${loadedProduct.rating}',
              //               //           style:
              //               //               TextStyle(fontWeight: FontWeight.bold),
              //               //         ),
              //               //         Icon(
              //               //           Icons.star_rate_rounded,
              //               //           color: Colors.amber[500],
              //               //         )
              //               //       ],
              //               //     ),
              //               //   ),
              //               // ),
              //               ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //PRICE WIDGET
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '${NumberFormat().format(loadedProduct.price)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 23,
                      ),
                      children: [
                        TextSpan(
                          text: 'SYP',
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //ADD TO CART BUTTON
              Flexible(
                child: cartProvider.isItemInCart(loadedProduct.id)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartProvider
                                        .removeSingleItem(loadedProduct.id);
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                            Text(
                              '${cartProvider.itemQuantity(loadedProduct.id)}',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartProvider.addItem(
                                        loadedProduct.id,
                                        loadedProduct.title,
                                        loadedProduct.price,
                                        loadedProduct.imageUrl);
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: 50.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              cartProvider.addItem(
                                  loadedProduct.id,
                                  loadedProduct.title,
                                  loadedProduct.price,
                                  loadedProduct.imageUrl);
                            },
                            child: const Center(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//   width: double.infinity,
//   height: 300,
//   child: AspectRatio(
//     aspectRatio: 16 / 9,
//     child: Image.network(
//       loadedProduct.imageUrl,
//       fit: BoxFit.contain,
//     ),
//   ),
// ),
