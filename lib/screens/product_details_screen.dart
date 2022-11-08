import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/product/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:kay_sy/widgets/custom_button.dart';
import 'package:kay_sy/widgets/custom_product/custom_product_widget.dart';
import 'package:kay_sy/widgets/review_widget.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import '../providers/language_provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/loader.dart';
import '../widgets/rating_star_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'loadedProduct-details-screen';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
// YASSER UPDATE 22/6 1:11AM

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double pRating = 3;
  double userRating = 0.0;
  bool expandForReview = false;

  int currentIndex = 0;
  CarouselController controller = CarouselController();

  File? _pickedImage;
  ImageSource? source;
  late final _future;
  late final id;
  bool init = true;

  @override
  void didChangeDependencies() {
    if (init) {
      id = ModalRoute.of(context)!.settings.arguments as String;
      print('***************$id**************');
      _future = Provider.of<ProductProvider>(context, listen: false)
          .getProductById(id);
      Provider.of<CartProvider>(context, listen: false).getCartItems();
      init = false;
    }
    super.didChangeDependencies();
  }

  Future pickImage() async {
    try {
      final selectedImage = await ImagePicker().pickImage(source: source!);
      if (selectedImage == null) return;
      final image = File(selectedImage.path);
      setState(() {
        _pickedImage = image;
      });
    } on PlatformException catch (e) {
      //FAILED TO PICK IMAGE
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return Stack(
      children: [
        SafeArea(
          child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                }
                print('done');
                final loadedProduct = snapshot.data as Product;
                print(loadedProduct.custom!.toJson());

                int total = 0;
                if (loadedProduct.custom!.products.isNotEmpty) {
                  total = Provider.of<ProductProvider>(context)
                      .productTotal(loadedProduct);
                }

                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        //TOP APP BAR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 45,
                              margin: const EdgeInsets.all(10),
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
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 45,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    Provider.of<ProductProvider>(context,
                                            listen: false)
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
                          child: CarouselSlider.builder(
                            carouselController: controller,
                            itemBuilder: (ctx, i, e) => Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 6,
                              shadowColor:
                                  Theme.of(context).colorScheme.secondary,
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
                                    "${Constants.baseUrl}/${loadedProduct.imageUrls[i]}",
                                  ),
                                ),
                              ),
                            ),
                            itemCount: loadedProduct.imageUrls.length,
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
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
                                          "${Constants.baseUrl}/${loadedProduct.imageUrls[i]}",
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
                        Align(
                          alignment: const Alignment(-0.9, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   section.title,
                              //   style:
                              //       TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
                              // ),
                              Text(
                                loadedProduct.title,
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        if (loadedProduct.custom!.products.isNotEmpty)
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.9),
                              itemCount: loadedProduct.custom!.products.length,
                              itemBuilder: (context, index) {
                                return CustomProductWidget(
                                    isSelected:
                                        Provider.of<ProductProvider>(context)
                                            .childIsSelected(
                                                loadedProduct,
                                                loadedProduct
                                                    .custom!.products[index]),
                                    product:
                                        loadedProduct.custom!.products[index],
                                    onTap: () {
                                      Provider.of<ProductProvider>(context,
                                              listen: false)
                                          .tapOnCustomProduct(
                                              loadedProduct,
                                              loadedProduct
                                                  .custom!.products[index]);
                                    });
                              }),
                        SizedBox(
                          height: 20.h,
                        ),
                        //title and category

                        //DESCRIPTON
                        Align(
                          alignment: const Alignment(-0.9, 1),
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
                            alignment: const Alignment(-0.9, 1),
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
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
                        //WRITE A COMMENT
                        // IF A PERSON ORDERS THIS PRODUCT, ONLY THEN HE CAN WRITE A COMMENT
                        if (!expandForReview)
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () {
                                setState(() {
                                  expandForReview = true;
                                  print(expandForReview);
                                });
                              },
                              icon: const Icon(Icons.add_comment_rounded),
                              label: const Text('Add a review')),
                        if (expandForReview)
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 20,
                            color: Colors.white.withOpacity(0.65),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 14),
                              height: 200.h,
                              width: 300.w,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Rating ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      StarRating(
                                          rating: userRating,
                                          onRatingChanged: (newRating) {
                                            setState(() {
                                              userRating = newRating;
                                            });
                                          },
                                          color: Colors.amber),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            expandForReview = false;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete_forever_rounded,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                  const TextField(
                                    decoration: InputDecoration(
                                      label: Text('Comment'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 2)),
                                          child: _pickedImage != null
                                              ? Image.file(
                                                  _pickedImage!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const FittedBox(
                                                  child: Center(
                                                  child: Text('no image'),
                                                )),
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    Wrap(children: [
                                                      Column(
                                                        children: [
                                                          ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .camera_alt),
                                                            title: const Text(
                                                                'Camera'),
                                                            onTap: () {
                                                              source =
                                                                  ImageSource
                                                                      .camera;
                                                              pickImage();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          ListTile(
                                                            leading: const Icon(
                                                                Icons.photo),
                                                            title: const Text(
                                                                'Gallery'),
                                                            onTap: () {
                                                              source =
                                                                  ImageSource
                                                                      .gallery;
                                                              pickImage();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ]));
                                          },
                                          icon: const Icon(Icons
                                              .add_photo_alternate_rounded),
                                          label: const Text('Add photo')),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          onPressed: () {},
                                          icon: const Icon(Icons.add),
                                          label: const Text('Post review')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        //REVIEWS
                        loadedProduct.reviews!.isEmpty
                            ? Center(
                                child: SizedBox(
                                  width: 150.w,
                                  child: Text(
                                    "NO REVIEWS FOR THIS PRODUCT....",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: loadedProduct.reviews!.length,
                                    itemBuilder: (ctx, i) => ReviewWidget(
                                        review: loadedProduct.reviews![i])),
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
                                text: NumberFormat().format(
                                    loadedProduct.custom != null
                                        ? total
                                        : loadedProduct.price),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                                              cartProvider.decreaseQuantity(
                                                  loadedProduct);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          )),
                                      Text(
                                        '${cartProvider.itemQuantity(loadedProduct.id)}',
                                        style: TextStyle(fontSize: 20.sp),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartProvider.addItem(
                                                loadedProduct,
                                              );
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
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
                                                loadedProduct,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(cartProvider
                                                          .message)));

                                              print(cartProvider.items);
                                            });
                                          })),
                                ),
                        ),
                      ])),
                );
              }),
        ),
        if (Provider.of<CartProvider>(context).isLoading) Loader()
      ],
    );
  }
}
