import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  String id;
  String city;
  String street;
  String buildingNumber;
  String floor;
  String? description;

  AddressModel(
      {required this.id,
      required this.city,
      required this.street,
      required this.buildingNumber,
      required this.floor,
      required this.description});
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
