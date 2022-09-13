import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kay_sy/models/custom_product.dart';
import 'package:kay_sy/models/review_model.dart';

import '../constants.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String title;
  int price;
  bool isFavorite;
  final List<String> imageUrls;
  final String description;
  final String section;
  final List<ReviewModel>? reviews;
  final CustomProduct? custom;
  double rating;

  Product(
      {required this.id,
      required this.section,
      required this.title,
      required this.price,
      required this.imageUrls,
      required this.description,
      required this.rating,
      this.reviews,
      this.isFavorite = false,
      this.custom});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
