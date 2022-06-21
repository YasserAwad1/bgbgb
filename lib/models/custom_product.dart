import 'package:kay_sy/models/product.dart';

class CustomProduct {
  final String id;

  final List<Product> products;
  final List<Product> chosenProducts;

  CustomProduct({
    required this.id,
    required this.products,
    required this.chosenProducts,
  });
}
