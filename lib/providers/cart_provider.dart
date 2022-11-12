import 'package:kay_sy/models/cart/cart_api_model.dart';
import 'package:kay_sy/services/cart_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../models/product/product.dart';

import '../models/cart/cart_model.dart';

class CartProvider with ChangeNotifier {
  final _service = CartService();
  bool isLoading = false;
  List<CartModel> _cartItems = [];
  String message = '';

  List<CartModel> get items {
    return [..._cartItems];
  }

  int get itemCount {
    return _cartItems.length;
  }

  Future<void> addItem(Product product, {String? specificNote}) async {
    isLoading = true;
    notifyListeners();
    final cartItem = CartApiModel(
        product: product.id,
        quantity: 1,
        user: '631f5020675e12ae28766a19',
        specificNote: specificNote);
    await _service.addItemToCart(cartItem);
    await getCartItems();
    message = _service.message!;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCartItems() async {
    isLoading = true;
    notifyListeners();
    _cartItems = await _service.getCart('631f5020675e12ae28766a19');

    getCartTotal();
    isLoading = false;
    notifyListeners();
  }

  int getCartTotal() {
    var total = 0;
    _cartItems.forEach((element) {
      total += element.product.price * element.quantity;
    });
    return total;
  }

  // void removeSingleItem(String itemId) {

  // }

  Future<void> removeItem(CartApiModel item) async {
    isLoading = true;

    await _service.deleteCartItem(item);
    await getCartItems();
    message = _service.message!;
    isLoading = false;
  }

  Future<void> clearCart() async {
    isLoading = true;
    notifyListeners();
    await _service.clearCart('631f5020675e12ae28766a19');
    await getCartItems();
    message = _service.message!;
    isLoading = false;
  }

  Future<void> decreaseQuantity(Product product) async {
    isLoading = true;
    notifyListeners();
    if (itemQuantity(product.id) == 1) {
      print("remove");
      await removeItem(CartApiModel(
          product: product.id, quantity: 1, user: '631f5020675e12ae28766a19'));
      return;
    }
    final cartItem = CartApiModel(
        product: product.id, quantity: -1, user: '631f5020675e12ae28766a19');
    await _service.addItemToCart(cartItem);
    await getCartItems();
    message = _service.message!;
    isLoading = false;
    notifyListeners();
  }

  int? itemQuantity(String id) {
    final item = _cartItems.firstWhere((element) => element.product.id == id);
    return item.quantity;
  }

  int itemTotal(String id) {
    final item = _cartItems.firstWhere((element) => element.id == id);
    return (item.quantity * item.product.price);
  }

  bool isItemInCart(String prodId) {
    for (var item in _cartItems) {
      if (item.product.id == prodId) {
        return true;
      }
    }
    return false;
  }
}
