import 'dart:convert';

import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/product.dart';

import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final url = Uri.parse("${Constants.productsUrl}/category/$categoryId");
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);
    List<Product> products = (jsonResponse['products'] as List)
        .map<Product>((json) => Product.fromJson(json))
        .toList();
    return products;
  }

  Future<Product> getProductById(String productId) async {
    try {
      final url = Uri.parse("${Constants.productsUrl}/$productId");
      final response = await http.get(url);

      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse['product']['reviews']);

      Product product = Product.fromJson(jsonResponse['product']);

      return product;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
