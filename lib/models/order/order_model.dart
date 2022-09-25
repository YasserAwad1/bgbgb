import 'package:json_annotation/json_annotation.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/models/cart/cart_model.dart';
import 'package:kay_sy/models/product.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String id;
  final String user;
  final AddressModel address;
  final String status;
  final List<CartModel> products;
  final int total;
  final int shippingPrice;
  final String createdAt;
  OrderModel(
      {required this.id,
      required this.user,
      required this.address,
      required this.status,
      required this.products,
      required this.total,
      required this.shippingPrice,
      required this.createdAt});
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
