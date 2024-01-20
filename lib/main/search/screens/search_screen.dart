import 'package:flutter/material.dart';
import 'package:kay_sy/main/search/widgets/SearchAppBar.dart';
import 'package:kay_sy/main/search/widgets/SearchProductsGrid.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:kay_sy/common/widgets/search_bar.dart';


class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SearchAppBar(),
          SearchBar(
            onChanged: (p0) {
              Provider.of<ProductProvider>(context, listen: false)
                  .getProductsBySearch(p0);
            },
          ),
          Provider.of<ProductProvider>(context).isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SearchProductsGrid()
        ],
      ),
    ));
  }
}
