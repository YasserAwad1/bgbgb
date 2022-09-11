import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import '../providers/cart_provider.dart';
import 'package:kay_sy/widgets/product_widget.dart';
import 'package:kay_sy/widgets/search_bar.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/productsScreen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final SectionModel section =
        Provider.of<SectionsProvider>(context).findById(id);
    final List<Product> products =
        Provider.of<ProductProvider>(context).findbySection(id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
              child: Row(
                children: [
                  BackButton(),
                  Spacer(),
                  Text(
                    "KAY",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                  Spacer(),
                  Consumer<CartProvider>(
                    builder: (_, cart, ch) => Badge(
                        child: ch!,
                        value: cart.itemCount.toString(),
                        color: Theme.of(context).colorScheme.secondary),
                    child: IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(CartScreen.routeName),
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
            //quote
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Text(
                    section.quote,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  IconData(section.icon, fontFamily: 'MaterialIcons'),
                  size: 50.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SearchBar(),
            SizedBox(
              height: 20.h,
            ),
            //categories
            Container(
              height: 50.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: section.categories?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10.sp),
                        color: selectedCategory == index
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
                        child: Text(
                          section.categories![index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10.h,),
            if (products.isNotEmpty)
              //products
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ProductWidget(product: products[index]);
                  })
          ],
        ),
      ),
    );
  }
}
