import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      section: 'c1',
      id: '1',
      imageUrl:
          'https://i.ibb.co/CVGzzzT/Pngtree-black-t-shirt-mockup-3610326.png',
      title: 'shirt men',
      price: 150000,
      rating: 0.0,
      comments:
          'this is a good product, delivery is fast. i love this shop but ahmad afif is a fucking bitch ',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      section: "c1",
      id: '2',
      imageUrl: 'https://i.ibb.co/Q90ddJD/Pngtree-t-shirt-mockup-3610313.png',
      title: 'chain logo T-Shirt',
      price: 1650000,
      rating: 3.0,
      comments: 'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    // Product(
    //   section: "c1",
    //   id: '3',
    //   imageUrl:
    //       'https://m.media-amazon.com/images/I/61M9K0JF8bL._AC_UX679_.jpg',
    //   title: 'long sleeved shirt',
    //   price: 256000,
    //   rating: 3.6,
    //   comments: 'this is a good product, ljslfksdflkjsldkjf',
    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //   // isFavorite: false,
    // ),
    // Product(
    //   section: "c1",
    //   id: '4',
    //   imageUrl:
    //       'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg',
    //   title: 'sport pants',
    //   price: 60000,
    //   rating: 3.8,
    //   comments: 'this is a good product, ljslfksdflkjsldkjf',
    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //   // isFavorite: false,
    // ),
    // Product(
    //   section: "c1",
    //   id: '5',
    //   imageUrl:
    //       'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg',
    //   title: 'sandals',
    //   price: 75000,
    //   rating: 4.2,
    //   comments: 'this is a good product, ljslfksdflkjsldkjf',
    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //   // isFavorite: false,
    // ),
  ];
  List<Product> trendingProducts = [
    Product(
      section: "c1",
      id: '4',
      imageUrl:
          'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg',
      title: 'sport pants',
      price: 60000,
      rating: 3.8,
      comments: 'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      section: "c1",
      id: '5',
      imageUrl:
          'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg',
      title: 'sandals',
      price: 75000,
      rating: 4.2,
      comments: 'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findById(String productId) {
    return _products.firstWhere((product) => product.id == productId);
  }

  List<Product> findbySection(String id) {
    return _products.where((element) => element.section == id).toList();
  }
}
