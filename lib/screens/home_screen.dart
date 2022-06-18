import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<String> _categories = [
    'All',
    'Accessories',
    'Tech',
    'Kitchen',
    'Furniture',
    'blabla',
    'another one',
  ];

  final List<IconData> _categoryIcons = [
    Icons.apps_rounded,
    Icons.auto_awesome_rounded,
    Icons.bolt_rounded,
    Icons.kitchen_outlined,
    Icons.home_max_outlined,
    Icons.outlet,
    Icons.place_rounded
  ];

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
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Theme.of(context).colorScheme.primary,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('search'),
                        Icon(
                          Icons.search,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              _categoryIcons[i],
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: FittedBox(
                              child: Center(
                                child: Text(
                                  _categories[i],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productProvider.products.length,
                itemBuilder: (ctx, i) => ProductWidget(
                  id: productProvider.products[i].id,
                  title: productProvider.products[i].title,
                  imageUrl: productProvider.products[i].imageUrl,
                  description: productProvider.products[i].description,
                  price: productProvider.products[i].price,
                  index: i,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
