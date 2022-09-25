import 'package:kay_sy/models/cart/cart_api_model.dart';

class OrderApiModel {
  final String user;

  final String address;
  final int total;
  final int shippingPrice;
  OrderApiModel(
      {required this.user,
      required this.address,
      required this.total,
      required this.shippingPrice});
  factory OrderApiModel.fromJson(Map<String, dynamic> json) {
    return OrderApiModel(
        user: json['user'],
        address: json['address'],
        total: json['total'],
        shippingPrice: json['shippingPrice']);
  }
  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'address': address,
      'total': total,
      'shippingPrice': shippingPrice
    };
  }
}
