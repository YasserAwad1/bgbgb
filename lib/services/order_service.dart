import 'dart:convert';
import 'dart:io';

import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/order/order_model.dart';

import 'package:http/http.dart' as http;

import '../models/order/order_api_model.dart';

class OrderServices {
  String message = '';
  Future<List<OrderModel>> getOrders(String userId) async {
    try {
      final url = Uri.parse('${Constants.ordersUrl}/$userId');
      final response = await http.get(url);
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      final List<OrderModel> orders = [];
      for (var order in jsonResponse['orders']) {
        orders.add(OrderModel.fromJson(order));
      }
      return orders;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> placeOrder(OrderApiModel order) async {
    final url = Uri.parse(Constants.ordersUrl);
    final response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(order.toJson()));
    print(response.body);
    if (response.statusCode == 201) {
      final jsonresponse = jsonDecode(response.body);
      message = jsonresponse['message'];
      return true;
    } else {
      message = 'Error placing order';
      return false;
    }
  }
}
