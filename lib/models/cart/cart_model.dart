import 'package:json_annotation/json_annotation.dart';
import 'package:kay_sy/models/product/product.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String id;
  final Product product;
  int quantity;

  CartModel({required this.id, required this.product, required this.quantity});
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
