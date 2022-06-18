import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
    String itemId,
    String title,
    int price,
    String imageUrl,
  ) {
    if (_items.containsKey(itemId)) {
      _items.update(
        itemId,
        (existingCartItem) => CartModel(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.price,
          existingCartItem.quantity + 1,
          imageUrl,
        ),
      );
    }
    _items.putIfAbsent(
      itemId,
      () => CartModel(
        itemId,
        title,
        price.toInt(),
        1,
        imageUrl,
      ),
    );
    notifyListeners();
  }

  int get cartTotal {
    var total = 0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void removeSingleItem(String itemId) {
    if (!_items.containsKey(itemId)) {
      return;
    }
    if (_items.containsKey(itemId)) {
      if (_items[itemId]!.quantity > 1) {
        _items[itemId]!.quantity -= 1;
      } else {
        _items.remove(itemId);
      }
    }
  }

  void removeItem(String itemId) {
    _items.remove(itemId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
