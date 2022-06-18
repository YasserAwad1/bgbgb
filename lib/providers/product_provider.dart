import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      imageUrl:
          'https://americaneagle.online/wp-content/uploads/2017/07/AE-T-shirt-Front-Mockup-Men-.jpg',
      title: 'shirt men',
      price: 150000,
      rating: 3.5,
      comments: 
        'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      id: '2',
      imageUrl:
          'https://images.ikrix.com/product_images/original/michael-kors-t-shirts-chain-logo-t-shirt-00000237630f00s001.jpg',
      title: 'chain logo T-Shirt',
      price: 130000,
      rating: 3.0,
      comments: 
        'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      id: '3',
      imageUrl:
          'https://m.media-amazon.com/images/I/61M9K0JF8bL._AC_UX679_.jpg',
      title: 'long sleeved shirt',
      price: 256000,
      rating: 3.6,
      comments: 
        'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      id: '4',
      imageUrl:
          'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg',
      title: 'sport pants',
      price: 60000,
      rating: 3.8,
      comments: 
        'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
    Product(
      id: '5',
      imageUrl:
          'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg',
      title: 'sandals',
      price: 75000,
      rating: 4.2,
      comments: 
        'this is a good product, ljslfksdflkjsldkjf',
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findById(String productId) {
    return products.firstWhere((product) => product.id == productId);
  }

}
