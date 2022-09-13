import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/custom_product.dart';
import 'package:kay_sy/models/review_model.dart';
import 'package:kay_sy/services/sections_services.dart';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final _sectionsService = SectionsServices();
  List<Product> _products = [
    // Product(
    //   section: "c1",
    //   id: '4',
    //   imageUrls: [
    //     'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //   ],
    //   title: 'sport pants',
    //   price: 60000,
    //   rating: 3.8,
    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    // ),
    // Product(
    //   section: "c1",
    //   id: '5',
    //   imageUrls: [
    //     'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg'
    //   ],
    //   title: 'sandals',
    //   price: 75000,
    //   rating: 4.2,

    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //   // isFavorite: false,
    // ),
    // Product(
    //   section: 'c1',
    //   id: '1',
    //   imageUrls: [
    //     'https://i.ibb.co/CVGzzzT/Pngtree-black-t-shirt-mockup-3610326.png',
    //     'https://i.ibb.co/Q90ddJD/Pngtree-t-shirt-mockup-3610313.png',
    //     'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //   ],
    //   title: 'shirt men',
    //   price: 150000,
    //   rating: 0.0,
    //   reviews: [
    //     ReviewModel(
    //         id: 'r1',
    //         date: DateTime.now(),
    //         userId: "u1",
    //         content:
    //             "Very good shirt it looks very nice on my friend yasser check his photo",
    //         image:
    //             "https://ae01.alicdn.com/kf/H3794144e8c364d0aa688c0da9c98ea79W.jpg")
    //   ],

    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //   // isFavorite: false,
    // ),
    // Product(
    //   section: "c1",
    //   id: '2',
    //   imageUrls: [
    //     'https://i.ibb.co/Q90ddJD/Pngtree-t-shirt-mockup-3610313.png'
    //   ],
    //   title: 'chain logo T-Shirt',
    //   price: 1650000,
    //   rating: 3.0,
    //   custom: CustomProduct(
    //     id: 'ss',
    //     products: [
    //       Product(
    //         section: "c1",
    //         id: '5',
    //         imageUrls: [
    //           'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg'
    //         ],
    //         title: 'sandals',
    //         price: 75000,
    //         rating: 4.2,

    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //         // isFavorite: false,
    //       ),
    //       Product(
    //         section: "c122",
    //         id: '522',
    //         imageUrls: [
    //           'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg'
    //         ],
    //         title: 'sandals',
    //         price: 75000,
    //         rating: 4.2,

    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //         // isFavorite: false,
    //       ),
    //       Product(
    //         section: "c133",
    //         id: '544',
    //         imageUrls: [
    //           'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg'
    //         ],
    //         title: 'sandals',
    //         price: 75000,
    //         rating: 4.2,

    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //         // isFavorite: false,
    //       ),
    //       Product(
    //         section: "c144",
    //         id: '44',
    //         imageUrls: [
    //           'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //         ],
    //         title: 'sport pants',
    //         price: 60000,
    //         rating: 3.8,
    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //       ),
    //       Product(
    //         section: 'c1',
    //         id: '1',
    //         imageUrls: [
    //           'https://i.ibb.co/CVGzzzT/Pngtree-black-t-shirt-mockup-3610326.png',
    //           'https://i.ibb.co/Q90ddJD/Pngtree-t-shirt-mockup-3610313.png',
    //           'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //         ],
    //         title: 'shirt men',
    //         price: 150000,
    //         rating: 0.0,
    //         reviews: [
    //           ReviewModel(
    //               id: 'r1',
    //               date: DateTime.now(),
    //               userId: "u1",
    //               content:
    //                   "Very good shirt it looks very nice on my friend yasser check his photo",
    //               image:
    //                   "https://ae01.alicdn.com/kf/H3794144e8c364d0aa688c0da9c98ea79W.jpg")
    //         ],

    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //         // isFavorite: false,
    //       ),
    //     ],
    //     chosenProducts: [
    //       // Product(
    //       //   section: "c1",
    //       //   id: '4',
    //       //   imageUrls: [
    //       //     'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //       //   ],
    //       //   title: 'sport pants',
    //       //   price: 60000,
    //       //   rating: 3.8,
    //       //   description:
    //       //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //       // ),
    //       Product(
    //         section: 'c1',
    //         id: '1',
    //         imageUrls: [
    //           'https://i.ibb.co/CVGzzzT/Pngtree-black-t-shirt-mockup-3610326.png',
    //           'https://i.ibb.co/Q90ddJD/Pngtree-t-shirt-mockup-3610313.png',
    //           'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
    //         ],
    //         title: 'shirt men',
    //         price: 150000,
    //         rating: 0.0,
    //         reviews: [
    //           ReviewModel(
    //               id: 'r1',
    //               date: DateTime.now(),
    //               userId: "u1",
    //               content:
    //                   "Very good shirt it looks very nice on my friend yasser check his photo",
    //               image:
    //                   "https://ae01.alicdn.com/kf/H3794144e8c364d0aa688c0da9c98ea79W.jpg")
    //         ],
    //         description:
    //             'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    //       ),
    //     ],
    //   ),
    //   description:
    //       'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    // ),
  ];
  List<Product> trendingProducts = [
    Product(
      section: "c1",
      id: '4',
      imageUrls: [
        'https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg'
      ],
      title: 'sport pants',
      price: 60000,
      rating: 3.8,
      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
    ),
    Product(
      section: "c1",
      id: '5',
      imageUrls: [
        'https://paylessus.vtexassets.com/arquivos/ids/219458-800-800?v=637572182932500000&width=800&height=800&aspect=true.jpg'
      ],
      title: 'sandals',
      price: 75000,
      rating: 4.2,

      description:
          'it is a shirt thats full cotton, we manufactures theses shirts in our company',
      // isFavorite: false,
    ),
  ];
  bool isLoading = false;

  List<Product> get products {
    return [..._products];
  }

  Product findById(String productId) {
    return _products.firstWhere((product) => product.id == productId);
  }

  Future<void> findbySection(String id) async {
    isLoading = true;
    notifyListeners();
    _products = await _sectionsService.getProductsOfSection(id);
    isLoading = false;
    notifyListeners();
  }

  void toggleFavoriteStatus(Product p) {
    p.isFavorite = !p.isFavorite;
    notifyListeners();
  }

  List<Product> get favoriteItems {
    return _products.where((product) => product.isFavorite).toList();
  }

  void tapOnCustomProduct(Product outerProduct, Product innerProduct) {
    bool contains = outerProduct.custom!.chosenProducts
        .any((element) => element.id == innerProduct.id);
    if (contains) {
      if (outerProduct.custom!.chosenProducts.length == 1) {
        return;
      }
      outerProduct.custom!.chosenProducts
          .removeWhere((element) => element.id == innerProduct.id);
      notifyListeners();
    } else {
      outerProduct.custom!.chosenProducts.add(innerProduct);
      notifyListeners();
    }
  }
}
