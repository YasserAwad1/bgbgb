// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomProduct _$CustomProductFromJson(Map<String, dynamic> json) =>
    CustomProduct(
      id: json['_id'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      chosenProducts: (json['chosenProducts'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomProductToJson(CustomProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'chosenProducts': instance.chosenProducts,
    };
