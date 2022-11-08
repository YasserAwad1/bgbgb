import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/product/custom_product.dart';
import 'package:kay_sy/models/product/review_model.dart';
import 'package:kay_sy/services/product_service.dart';
import 'package:kay_sy/services/sections_services.dart';

import '../models/product/product.dart';

class ProductProvider with ChangeNotifier {
  final _sectionsService = SectionsServices();
  final _service = ProductService();
  List<Product> _products = [];
  List<Product> trendingProducts = [
    Product(
      category: 'ss',
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
      category: 'ss',
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
  List<Product> searchProducts = [];
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

  bool childIsSelected(Product paretnProduct, Product childProduct) {
    bool contains = paretnProduct.custom!.chosenProducts
        .any((element) => element.id == childProduct.id);
    return contains;
  }

  int productTotal(Product product) {
    int total = 0;
    product.custom!.chosenProducts.forEach(
      (element) => total += element.price,
    );
    return total;
  }

  getProductsByCategory(String id) async {
    isLoading = true;
    notifyListeners();
    _products = await _service.getProductsByCategory(id);
    isLoading = false;
    notifyListeners();
  }

  getProductById(String id) async {
    isLoading = true;
    notifyListeners();
    final product = await _service.getProductById(id);
    isLoading = false;
    notifyListeners();
    return product;
  }

  getProductsBySearch(String search) async {
    isLoading = true;
    notifyListeners();
    searchProducts = await _service.getProductsBySearch(search);
    isLoading = false;
    notifyListeners();
  }
}
