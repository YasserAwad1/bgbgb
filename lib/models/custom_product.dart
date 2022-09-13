import 'package:json_annotation/json_annotation.dart';
import 'package:kay_sy/models/product.dart';

part 'custom_product.g.dart';

@JsonSerializable()
class CustomProduct {
  final String id;

  final List<Product> products;
  final List<Product> chosenProducts;

  CustomProduct({
    required this.id,
    required this.products,
    required this.chosenProducts,
  });
  factory CustomProduct.fromJson(Map<String, dynamic> json) =>
      _$CustomProductFromJson(json);
  Map<String, dynamic> toJson() => _$CustomProductToJson(this);
}
