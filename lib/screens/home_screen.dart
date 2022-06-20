import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/cart_provider.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:kay_sy/widgets/search_bar.dart';
import 'package:kay_sy/widgets/section_widget.dart';
import 'package:kay_sy/widgets/popular_product_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';

import '../providers/product_provider.dart';
import '../screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        //  bottomNavigationBar: DemoMWBottomNavigationScreen5(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ListTile(
                        horizontalTitleGap: 1,
                        onTap: null,
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          'Deliver to',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          overflow: TextOverflow.clip,
                          'Mazzeh, mohafaza builing no.7 ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    Consumer<CartProvider>(
                      builder: (_, cart, ch) => Badge(
                          child: ch!,
                          value: cart.itemCount.toString(),
                          color: Theme.of(context).colorScheme.secondary),
                      child: IconButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(CartScreen.routeName),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'What are you looking for ?',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SearchBar(),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: const Alignment(-1, 1),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Text(
                    "Trending ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CarouselSlider.builder(
                  itemCount: productProvider.trendingProducts.length,
                  itemBuilder: (context, index, e) {
                    return PopularProductWidget(
                        id: productProvider.trendingProducts[index].id,
                        title: productProvider.trendingProducts[index].title,
                        imageUrl:
                            productProvider.trendingProducts[index].imageUrl,
                        description:
                            productProvider.trendingProducts[index].description,
                        price: productProvider.trendingProducts[index].price,
                        index: index);
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      height: 200.h,
                      viewportFraction: 0.5,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      clipBehavior: Clip.none)),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    "Sections ",
                    style: TextStyle(
                        fontFamily: 'AnekMalayalam',
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 220.h,
                child: Padding(
                  padding: EdgeInsets.all(25.0.w),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120.w,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: Provider.of<SectionsProvider>(context)
                        .categories
                        .length,
                    itemBuilder: (ctx, index) => SectionWidget(
                      id: Provider.of<SectionsProvider>(context)
                          .categories[index]
                          .id,
                      icon: Provider.of<SectionsProvider>(context)
                          .categories[index]
                          .icon,
                      title: Provider.of<SectionsProvider>(context)
                          .categories[index]
                          .title,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
