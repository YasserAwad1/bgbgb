import 'package:json_annotation/json_annotation.dart';

part 'cart_api_model.g.dart';

@JsonSerializable()
class CartApiModel {
  final String product;
  int quantity;
  final String user;
  final String? specificNote;
  CartApiModel(
      {required this.product,
      required this.quantity,
      required this.user,
      this.specificNote});
  factory CartApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartApiModelToJson(this);
}
