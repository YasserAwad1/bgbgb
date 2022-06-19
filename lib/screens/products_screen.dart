import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/product.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:kay_sy/widgets/product_widget.dart';
import 'package:kay_sy/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/productsScreen';

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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined))
                ],
              ),
            ),
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
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.5,
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
