import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../models/category_model.dart';
import '../../../../providers/product_provider.dart';
import '../../../../providers/sections_provider.dart';

class CategoriesList extends StatelessWidget {
  String id;
  List<CategoryModel> categories;
  CategoriesList({
    super.key,
    required this.categories,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Consumer<SectionsProvider>(builder: (context, c, child) {
              return GestureDetector(
                onTap: () async {
                  c.selectCategory(index);
                  if (categories[index].id == '1') {
                    await Provider.of<ProductProvider>(context, listen: false)
                        .findbySection(id);
                  } else {
                    await Provider.of<ProductProvider>(context, listen: false)
                        .getProductsByCategory(categories[index].id);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.sp),
                  color: c.selectedCategory == index
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
                  child: Text(
                    categories[index].title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            });
          }),
    );
  }
}
