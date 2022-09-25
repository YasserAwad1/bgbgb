// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      user: json['user'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      status: json['status'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      shippingPrice: json['shippingPrice'] as int,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'status': instance.status,
      'products': instance.products,
      'total': instance.total,
      'shippingPrice': instance.shippingPrice,
    };
