import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/main/products/widgets/products_screen/CategoriesList.dart';
import 'package:kay_sy/main/products/widgets/products_screen/CustomSliverAppBar.dart';
import 'package:kay_sy/main/products/widgets/products_screen/CustomSliverHeader.dart';
import 'package:kay_sy/main/products/widgets/products_screen/ProductsGrid.dart';
import 'package:kay_sy/models/category_model.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:kay_sy/providers/sections_provider.dart';
// import 'package:kay_sy/common/widgets/search_bar.dart';
import 'package:provider/provider.dart';


class ProductsScreen extends StatefulWidget {
  static const routeName = '/productsScreen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int? selectedCategory;
  late final String id;
  @override
  Future<void> didChangeDependencies() async {
    id = ModalRoute.of(context)!.settings.arguments as String;
    print(id);
    await Provider.of<ProductProvider>(context, listen: false)
        .findbySection(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<SectionsProvider>(context, listen: false)
              .getSectionById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final SectionModel section = snapshot.data as SectionModel;
            final List<CategoryModel> categories = [
              CategoryModel(id: '1', title: 'All'),
              if (section.categories != null) ...section.categories!
            ];
            return CustomScrollView(
              slivers: [
                const CustomSliverAppBar(),
                CustomSliverHeader(
                  section: section,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 20.h,
                      ),
                      SearchBar(
                        onChanged: (v) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //CATEGORIES
                      CategoriesList(
                        categories: categories,
                        id: id,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Provider.of<ProductProvider>(context).isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          :
                          //PRODUCTS GRID
                          const ProductsGrid(),
                      SizedBox(
                        height: 200.h,
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
