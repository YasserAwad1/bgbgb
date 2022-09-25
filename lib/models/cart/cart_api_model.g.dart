// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartApiModel _$CartApiModelFromJson(Map<String, dynamic> json) => CartApiModel(
      product: json['product'] as String,
      quantity: json['quantity'] as int,
      user: json['user'] as String,
    );

Map<String, dynamic> _$CartApiModelToJson(CartApiModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'user': instance.user,
    };
