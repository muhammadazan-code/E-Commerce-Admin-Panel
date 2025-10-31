import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final int totalAmount;
  final OrderStatus orderStatus;
  final DateTime orderData;
  final String userId;
  final DateTime? deliveryDate;

  const OrderModel({
    required this.id,
    required this.totalAmount,
    required this.orderStatus,
    required this.orderData,
    required this.deliveryDate,
    this.userId = '',
  });
  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderData);
  String get formattedDeliveredDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';
  String get orderStatusText => orderStatus == OrderStatus.delivered
      ? "Delivered"
      : orderStatus == OrderStatus.shipped
      ? "Shipment on the way"
      : "Processing";

  /// Static function to create an empty user models
  static OrderModel empty() => OrderModel(
    id: '',
    totalAmount: 0,
    orderStatus: OrderStatus.pending,
    orderData: DateTime.now(),
    deliveryDate: DateTime.now(),
  );

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId};
  }
}
