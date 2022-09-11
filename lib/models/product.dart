import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/custom_product.dart';
import 'package:kay_sy/models/review_model.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final int price;
  final List<String> imageUrls;
  final String description;
  final String section;
  final List<ReviewModel>? reviews;
  final CustomProduct? custom;
  bool isFavorite;
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
}
