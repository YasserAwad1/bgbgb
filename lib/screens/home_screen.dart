import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/l10n/l10n.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/cart_provider.dart';
import 'package:kay_sy/providers/language_provider.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:kay_sy/screens/favorites_screen.dart';
import 'package:kay_sy/widgets/search_bar.dart';
import 'package:kay_sy/widgets/section_widget.dart';
import 'package:kay_sy/widgets/popular_product_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/badge.dart';
import '../models/address_model.dart';

import '../providers/product_provider.dart';
import '../providers/address_provider.dart';
import '../screens/cart_screen.dart';
import './add_address_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String _selectedLocation = '';
  bool isInit = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<CartProvider>(context, listen: false).getCartItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    var addressProvider = Provider.of<AddressProvider>(context);
    var addressList = addressProvider.addresses;
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    // var selectedLocation = addressList.first;

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ListTile(
                        horizontalTitleGap: 1,
                        onTap: () => showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            )),
                            context: context,
                            builder: (builder) {
                              return Container(
                                height: 250.h,
                                child: Column(children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .your_addresses,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  addressList.isEmpty
                                      ? SizedBox(
                                          height: 200.h,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // NO ADDRESSES YET
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .noAddress,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'AnekMalayalam',
                                                      color: Theme.of(context)
                                                          .errorColor,
                                                      fontSize: 16.sp),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              AddAddressScreen
                                                                  .routeName);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .add_location_alt,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                        Text(
                                                          // ADD ADDRESS
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .addAddress,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'AnekMalayalam',
                                                              fontSize:
                                                                  15.sp.sp),
                                                        )
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ))
                                      : Expanded(
                                          child: ListView.builder(
                                            itemCount: addressList.length,
                                            itemBuilder: (context, i) =>
                                                GestureDetector(
                                              onTap: () {
                                                Provider.of<AddressProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectLocation(
                                                        addressList[i]);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.h,
                                                    vertical: 4.w),
                                                child: Card(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //    STREET
                                                    RichText(
                                                      text: TextSpan(
                                                          text: AppLocalizations
                                                                  .of(context)!
                                                              .street,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    addressList[
                                                                            i]
                                                                        .street,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary)),
                                                          ]),
                                                    ),
                                                    //    BUILDING NUMBER
                                                    RichText(
                                                      text: TextSpan(
                                                          text: AppLocalizations
                                                                  .of(context)!
                                                              .bn,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                          children: [
                                                            TextSpan(
                                                                text: addressList[
                                                                        i]
                                                                    .buildingNumber,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary)),
                                                          ]),
                                                    ),
                                                    //     FLOOR
                                                    RichText(
                                                      text: TextSpan(
                                                          text: AppLocalizations
                                                                  .of(context)!
                                                              .floor,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    addressList[
                                                                            i]
                                                                        .floor,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary)),
                                                          ]),
                                                    ),
                                                    //     DETAILS
                                                    RichText(
                                                      text: TextSpan(
                                                          text: AppLocalizations
                                                                  .of(context)!
                                                              .details,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                          children: [
                                                            TextSpan(
                                                                text: addressList[
                                                                        i]
                                                                    .description,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary)),
                                                          ]),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ),
                                        )
                                ]),
                              );
                            }),
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.delivery,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          overflow: TextOverflow.clip,
                          Provider.of<AddressProvider>(context)
                                      .selectedAddress ==
                                  null
                              ? " Please Add an address"
                              : Provider.of<AddressProvider>(context)
                                  .selectedAddress!
                                  .street,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                        trailing: const Icon(Icons.expand_more_rounded),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(FavoritesScreen.routeName);
                      },
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
              SizedBox(
                height: 10.h,
              ),
              //   TRENDING
              Align(
                alignment:
                    isArabic ? const Alignment(1, -1) : const Alignment(-1, 1),
                child: Container(
                  width: isArabic ? 100.w : 90.w,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topRight:
                            isArabic ? Radius.zero : Radius.circular(15.sp),
                        bottomRight:
                            isArabic ? Radius.zero : Radius.circular(15.sp),
                        topLeft:
                            isArabic ? Radius.circular(15.sp) : Radius.zero,
                        bottomLeft:
                            isArabic ? Radius.circular(15.sp) : Radius.zero,
                      )),
                  child: Text(
                    AppLocalizations.of(context)!.trending,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp.sp,
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
                        imageUrl: productProvider
                            .trendingProducts[index].imageUrls[0],
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
              //   SECTIONS
              Align(
                alignment:
                    isArabic ? const Alignment(1, -1) : const Alignment(-1, 1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight:
                          isArabic ? Radius.zero : Radius.circular(15.sp.sp),
                      bottomRight:
                          isArabic ? Radius.zero : Radius.circular(15.sp.sp),
                      topLeft:
                          isArabic ? Radius.circular(15.sp.sp) : Radius.zero,
                      bottomLeft:
                          isArabic ? Radius.circular(15.sp.sp) : Radius.zero,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    AppLocalizations.of(context)!.sections,
                    style: TextStyle(
                        fontFamily: 'AnekMalayalam',
                        color: Colors.white,
                        fontSize: 15.sp.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FutureBuilder(
                  future: Provider.of<SectionsProvider>(context, listen: false)
                      .getSections(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: 220.h,
                      child: Padding(
                        padding: EdgeInsets.all(25.0.w),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120.w,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 20.w,
                            childAspectRatio: 1,
                          ),
                          itemCount: Provider.of<SectionsProvider>(context)
                              .sections
                              .length,
                          itemBuilder: (ctx, index) => SectionWidget(
                            id: Provider.of<SectionsProvider>(context)
                                .sections[index]
                                .id,
                            icon: Provider.of<SectionsProvider>(context)
                                .sections[index]
                                .icon,
                            title: Provider.of<SectionsProvider>(context)
                                .sections[index]
                                .title,
                          ),
                        ),
                      ),
                    );
                  }),
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
