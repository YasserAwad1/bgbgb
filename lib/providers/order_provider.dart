import 'package:flutter/foundation.dart';
import 'package:kay_sy/models/order/order_api_model.dart';
import 'package:kay_sy/models/order/order_model.dart';
import 'package:kay_sy/services/order_service.dart';

import '../models/cart/cart_model.dart';

class OrderProvider with ChangeNotifier {
  final _service = OrderServices();
  bool isLoading = false;
  List<OrderModel> _orders = [];
  String message = '';

  List<OrderModel> get orders {
    return [..._orders];
  }

  Future<bool> addOrder(String address, int total, int shippingPrice) async {
    isLoading = true;
    notifyListeners();
    final order = OrderApiModel(
        user: '631f5020675e12ae28766a19',
        address: "632fef156daa5de7894a9dec",
        total: total,
        shippingPrice: shippingPrice);
    final success = await _service.placeOrder(order);
    isLoading = false;
    message = _service.message;
    notifyListeners();
    return success;
  }

  Future<void> getOrders() async {
    isLoading = true;
    notifyListeners();
    print('sss');
    _orders = await _service.getOrders('631f5020675e12ae28766a19');
    isLoading = false;
    notifyListeners();
  }
}
