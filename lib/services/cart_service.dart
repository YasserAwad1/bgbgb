import 'dart:convert';
import 'dart:io';

import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/cart/cart_model.dart';
import 'package:http/http.dart' as http;

import '../models/cart/cart_api_model.dart';

class CartService {
  String? message;
  Future<bool> addItemToCart(CartApiModel item) async {
    try {
      final url = Uri.parse(Constants.cartUrl);

      final response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(item.toJson()));
      print(item.toJson());
      if (response.statusCode == 201) {
        message = jsonDecode(response.body)['message'];
        return true;
      } else {
        message = 'Error adding item to cart';
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<CartModel>> getCart(String userId) async {
    final url = Uri.parse('${Constants.baseUrl}/cart/$userId');
    final response = await http.get(url);

    final jsonResponse = jsonDecode(response.body);
    final List<CartModel> items = [];
    if (jsonResponse['cart'] != null) {
      for (var item in jsonResponse['cart']['products']) {
        items.add(CartModel.fromJson(item));
      }
    }

    return items;
  }

  Future<void> deleteCartItem(CartApiModel item) async {
    final url = Uri.parse(Constants.cartUrl);
    final response = await http.delete(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(item.toJson()));
    print(item.toJson());
    print(response.body);
    if (response.statusCode == 200) {
      message = 'Item deleted';
      print(message);
    } else {
      message = 'Error';
    }
  }

  Future<void> clearCart(String userId) async {
    final url = Uri.parse('${Constants.cartUrl}/$userId');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      message = 'cart Cleared';
    } else {
      message = 'Error';
    }
  }

  decreaseQuantity(CartApiModel item) async {
    try {
      final url = Uri.parse("${Constants.cartUrl}/remove");

      final response = await http.put(url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(item.toJson()));
      print(item.toJson());
      if (response.statusCode == 201) {
        message = jsonDecode(response.body)['message'];
        print(message);
      } else {
        message = 'Error decreasing quantity';
        print(message);
      }
    } catch (e) {
      print(e);
    }
  }
}
