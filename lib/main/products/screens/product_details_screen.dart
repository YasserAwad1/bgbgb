import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/main/products/widgets/product_details/Pd_top_bar.dart';
import 'package:kay_sy/main/products/widgets/product_details/add_review_button.dart';
import 'package:kay_sy/main/products/widgets/product_details/comment_card_widget.dart';
import 'package:kay_sy/main/products/widgets/product_details/custom_product_grid.dart';
import 'package:kay_sy/main/products/widgets/product_details/images_carousel.dart';
import 'package:kay_sy/main/products/widgets/product_details/pd_bottom_bar..dart';
import 'package:kay_sy/main/products/widgets/product_details/product_information.dart';
import 'package:kay_sy/main/products/widgets/product_details/product_name.dart';
import 'package:kay_sy/main/products/widgets/product_details/product_reviews.dart';
import 'package:kay_sy/main/products/widgets/product_details/rating_widget.dart';
import 'package:kay_sy/main/products/widgets/product_details/small_images.dart';
import 'package:kay_sy/models/product/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:kay_sy/common/widgets/custom_button.dart';
import 'package:kay_sy/widgets/custom_product/custom_product_widget.dart';
import 'package:kay_sy/main/products/widgets/product_details/review_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import '../../../providers/product_provider.dart';
import '../../../providers/cart_provider.dart';
import '../../../common/widgets/loader.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'loadedProduct-details-screen';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
// YASSER UPDATE 22/6 1:11AM

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double userRating = 0.0;
  bool expandForReview = false;

  int currentIndex = 0;
  CarouselController controller = CarouselController();

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

  @override
  Widget build(BuildContext context) {
    // bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return Stack(
      children: [
        SafeArea(
          child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // print('waiting');
                  return const Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                }
                // print('done');
                final loadedProduct = snapshot.data as Product;
                // print(loadedProduct.custom!.toJson());

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
                        PdTopBar(
                          loadedProduct: loadedProduct,
                        ),

                        //CAROUSEL SLIDER
                        ImagesCarousel(
                          loadedProduct: loadedProduct,
                          controller: controller,
                          currentIndex: currentIndex,
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //SMALL IMAGES
                        SmallImages(
                          loadedProduct: loadedProduct,
                          controller: controller,
                          currentIndex: currentIndex,
                        ),

                        //PRODUCT NAME
                        ProductName(
                          loadedProduct: loadedProduct,
                        ),
                        const Divider(
                          thickness: 2,
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        if (loadedProduct.custom!.products.isNotEmpty)
                          CustomProductGrid(
                            loadedProduct: loadedProduct,
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //title and category

                        //DESCRIPTON
                        ProductInformation(
                          loadedProduct: loadedProduct,
                        ),

                        //REVIEWS
                        const PdRatingWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        //WRITE A COMMENT
                        // IF A PERSON ORDERS THIS PRODUCT, ONLY THEN HE CAN WRITE A COMMENT
                        if (!expandForReview)
                          AddReviewButton(
                            expandForReview: expandForReview,
                          ),
                        if (expandForReview)
                          CommentCardWidget(
                            expandForReview: expandForReview,
                          ),
                        //REVIEWS
                        ProductReviews(
                          loadedProduct: loadedProduct,
                        )
                      ],
                    ),
                  ),
                  //BOTTOM NAVIGATION BAR
                  bottomNavigationBar: PdBottomBar(
                    loadedProduct: loadedProduct,
                    total: total,
                  ),
                );
              }),
        ),
        if (Provider.of<CartProvider>(context).isLoading) Loader()
      ],
    );
  }
}
