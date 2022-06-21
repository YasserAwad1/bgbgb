import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kay_sy/models/product.dart';

import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:kay_sy/widgets/custom_product_widget.dart';
import 'package:kay_sy/widgets/review_widget.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/rating_star_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'loadedProduct-details-screen';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double pRating = 3;

  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    final Product loadedProduct =
        Provider.of<ProductProvider>(context).findById(id);
    final cartProvider = Provider.of<CartProvider>(context);

    final SectionModel section =
        Provider.of<SectionsProvider>(context).findById(loadedProduct.section);
    int total = 0;
    loadedProduct.custom!.chosenProducts.forEach(
      (element) => total += element.price,
    );
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
                      onPressed: () {
                        setState(() {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleFavoriteStatus(loadedProduct);
                        });
                      },
                      icon: Icon(
                        loadedProduct.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: loadedProduct.isFavorite
                            ? Colors.red
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              //CAROUSEL SLIDER
              SizedBox(
                height: 230.h,
                child: loadedProduct.custom != null
                    ? Container(
                        color: Colors.white,
                        width: 180.w,
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              loadedProduct.custom!.chosenProducts.length,
                              (index) => Image.network(
                                    loadedProduct.custom!.chosenProducts[index]
                                        .imageUrls[0],
                                    fit: BoxFit.contain,
                                  )),
                          // scatter them randomly
                        ),
                      )
                    : CarouselSlider.builder(
                        carouselController: controller,
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
                            width: 320.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                loadedProduct.imageUrls[i],
                              ),
                            ),
                          ),
                        ),
                        itemCount: loadedProduct.imageUrls.length,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          autoPlay: false,
                        ),
                      ),
              ),
              SizedBox(
                height: 15.h,
              ),
              //SMALL IMAGES
              if (loadedProduct.custom == null)
                SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: loadedProduct.imageUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.animateToPage(i);
                                currentIndex = i;
                              });
                            },
                            child: Container(
                              width: 50.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: currentIndex == i
                                        ? Colors.red
                                        : Theme.of(context)
                                            .colorScheme
                                            .primary),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  loadedProduct.imageUrls[i],
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20.h,
              ),
              //title and category
              Align(
                alignment: Alignment(-0.9, 1),
                child: Column(
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
              ),
              Divider(
                thickness: 2,
              ),

              SizedBox(
                height: 10.h,
              ),
              //adding products to screen
              if (loadedProduct.custom != null)
                Column(
                  children: [
                    Align(
                      alignment: Alignment(-0.9, 1),
                      child: Text(
                        "SELECT PRODUCTS TO ADD THEM",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 100.h,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120.w,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 20.w,
                            childAspectRatio: 1,
                          ),
                          itemCount: loadedProduct.custom!.products.length,
                          itemBuilder: (context, index) {
                            return CustomProductWidget(
                                isSelected: loadedProduct.custom!.chosenProducts
                                    .any((product) {
                                  return loadedProduct
                                          .custom!.products[index].id ==
                                      product.id;
                                }),
                                product: loadedProduct.custom!.products[index],
                                onTap: () {
                                  Provider.of<ProductProvider>(context,
                                          listen: false)
                                      .tapOnCustomProduct(
                                          loadedProduct,
                                          loadedProduct
                                              .custom!.products[index]);
                                });
                          }),
                    ),
                  ],
                ),
              //DESCRIPTON
              Align(
                alignment: Alignment(-0.9, 1),
                child: Text(
                  'INFORMATION',
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
              //Rating

              Container(
                padding: EdgeInsets.all(15.h),
                width: 300.w,
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$pRating',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    RatingBar.builder(
                      itemSize: 30.sp,
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
              loadedProduct.reviews == null
                  ? Center(
                      child: SizedBox(
                        width: 150.w,
                        child: Text(
                          "NO REVIEWS FOR THIS PRODUCT....",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: loadedProduct.reviews!.length,
                          itemBuilder: (ctx, i) =>
                              ReviewWidget(review: loadedProduct.reviews![i])),
                    )
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
                      text: NumberFormat().format(total),
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
                                        loadedProduct.imageUrls[0]);
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
                                  loadedProduct.imageUrls[0]);
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
