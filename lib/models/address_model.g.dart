// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      buildingNumber: json['buildingNumber'] as String,
      floor: json['floor'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'street': instance.street,
      'buildingNumber': instance.buildingNumber,
      'floor': instance.floor,
      'description': instance.description,
    };
