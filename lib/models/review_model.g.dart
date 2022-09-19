// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['_id'] as String,
      user: json['user'] as String,
      content: json['content'] as String?,
      image: json['image'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 1,
      date: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'content': instance.content,
      'image': instance.image,
      'rating': instance.rating,
      'date': instance.date.toIso8601String(),
    };
