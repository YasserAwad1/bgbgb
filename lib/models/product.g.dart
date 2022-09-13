// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      section: json['section'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      imageUrls: (json['imageUrls'] as List<dynamic>)
          .map((e) => "${Constants.baseUrl}/$e")
          .toList(),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      custom: json['custom'] == null
          ? null
          : CustomProduct.fromJson(json['custom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
      'imageUrls': instance.imageUrls,
      'description': instance.description,
      'section': instance.section,
      'reviews': instance.reviews,
      'custom': instance.custom,
      'rating': instance.rating,
    };
