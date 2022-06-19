import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/rating_star_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double pRating = 3;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    final loadedProduct =
        Provider.of<ProductProvider>(context, listen: true).findById(id);

    final cartProvider = Provider.of<CartProvider>(context);
    final section =
        Provider.of<SectionsProvider>(context).findById(loadedProduct.section);

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
                  Text(
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
              SizedBox(
                height: 15.h,
              ),
              //SMALL IMAGES
              SizedBox(
                height: 50.h,
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

              // TITLE AND RATING
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title,
                        style:
                            TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
                      ),
                      Text(
                        loadedProduct.title,
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            '${loadedProduct.rating}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber[500],
                          size: 25.sp,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              //DESCRIPTON
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment(-0.9, 1),
                child: Text(
                  'Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Text(
                  loadedProduct.description,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
              Align(
                  alignment: Alignment(-0.9, 1),
                  child: Container(
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),

              Container(
                padding: EdgeInsets.all(15.h),
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$pRating',
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    RatingBar.builder(
                      initialRating: pRating,
                      glow: false,
                      ignoreGestures: true,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          pRating = rating;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //REVIEWS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
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
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            SizedBox(width: 4.w),
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
                        Text(
                          loadedProduct.comments,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //PRICE WIDGET
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '${NumberFormat().format(loadedProduct.price)}',
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
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
