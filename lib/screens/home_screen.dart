import 'package:flutter/material.dart';
import 'package:kay_sy/models/category_model.dart';
import 'package:kay_sy/widgets/category_widget.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  List<CategoryModel> categories = [
    CategoryModel(id: "c1", title: "Accessories", image: "images/watch.png"),
    CategoryModel(id: "c2", title: "Tech", image: "images/tech.png"),
    CategoryModel(id: "c3", title: "Kitchen", image: "images/kitchen.png"),
    CategoryModel(id: "c4", title: "Furniture", image: "images/furniture.png"),
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
                height: 20,
              ),
              Align(
                alignment: Alignment(-0.9, 1),
                child: Text(
                  "Categories:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: CategoryWidget(
                          image: categories[index].image,
                          title: categories[index].title,
                        )),
                  ),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: Text(
              //       'All',
              //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productProvider.products.length,
                itemBuilder: (ctx, index) => ProductWidget(
                  id: productProvider.products[index].id,
                  title: productProvider.products[index].title,
                  imageUrl: productProvider.products[index].imageUrl,
                  description: productProvider.products[index].description,
                  price: productProvider.products[index].price,
                  index: index,
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
