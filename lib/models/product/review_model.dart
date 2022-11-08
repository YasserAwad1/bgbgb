import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final String id;
  final String user;
  final String? content;
  final String? image;
  final double rating;
  final DateTime date;
  ReviewModel({
    required this.id,
    required this.user,
    this.content,
    this.image,
    this.rating = 1,
    required this.date,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
