import 'package:kay_sy/models/cart_model.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.customerId,
    required this.orderDate,
    required this.orderStatus,
    required this.orderTotal,
    required this.orderItems,
  });

  final int id;
  final int customerId;
  final DateTime orderDate;
  final String orderStatus;
  final double orderTotal;
  final List<CartModel> orderItems;
}
