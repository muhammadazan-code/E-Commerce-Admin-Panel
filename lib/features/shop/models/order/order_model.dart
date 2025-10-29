import 'package:e_commerce_web/utils/constants/enums.dart';

class OrderModel {
  final String id;
  final int totalAmount;
  final OrderStatus orderStatus;
  final DateTime orderData;
  final DateTime deliveryDate;

  const OrderModel({
    required this.id,
    required this.totalAmount,
    required this.orderStatus,
    required this.orderData,
    required this.deliveryDate,
  });
}
