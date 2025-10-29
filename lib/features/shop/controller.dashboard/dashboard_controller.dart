import 'package:e_commerce_web/features/shop/models/order/order_model.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmount = <OrderStatus, double>{}.obs;
  final RxList<double> weeklySales = <double>[].obs;

  /// Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: "CWA0033",
      totalAmount: 200,
      orderStatus: OrderStatus.shipped,
      orderData: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 30),
    ),
    OrderModel(
      id: "CWA1233",
      totalAmount: 100,
      orderStatus: OrderStatus.shipped,
      orderData: DateTime(2025, 4, 12),
      deliveryDate: DateTime(2025, 5, 01),
    ),
    OrderModel(
      id: "CWA0953",
      totalAmount: 400,
      orderStatus: OrderStatus.delivered,
      orderData: DateTime(2025, 1, 10),
      deliveryDate: DateTime(2025, 1, 16),
    ),
    OrderModel(
      id: "CWA9484",
      totalAmount: 150,
      orderStatus: OrderStatus.processing,
      orderData: DateTime(2024, 3, 09),
      deliveryDate: DateTime(2024, 3, 20),
    ),
    OrderModel(
      id: "CWA7843",
      totalAmount: 1000,
      orderStatus: OrderStatus.processing,
      orderData: DateTime(2025, 8, 20),
      deliveryDate: DateTime(2025, 6, 30),
    ),
    OrderModel(
      id: "CWA1432",
      totalAmount: 500,
      orderStatus: OrderStatus.delivered,
      orderData: DateTime(2023, 7, 17),
      deliveryDate: DateTime(2023, 8, 10),
    ),
    OrderModel(
      id: "CWA0033",
      totalAmount: 200,
      orderStatus: OrderStatus.shipped,
      orderData: DateTime(2022, 9, 4),
      deliveryDate: DateTime(2022, 9, 11),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  /// Calculate weekly sales
  void _calculateWeeklySales() {
    /// Reset Weekly Sales to zero.
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(
        order.orderData,
      );

      /// Check if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderData.weekday - 1) % 7;

        /// Ensures the index is non-negative
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;

        if (kDebugMode) {
          print(
            "OrderDate: ${order.orderData}, CurrentWeekDay: $orderWeekStart, Index: $index",
          );
        }
      }
    }
    if (kDebugMode) {
      print("Weekly Sales : $weeklySales");
    }
  }

  void _calculateOrderStatusData() {
    /// Reset status data
    orderStatusData.clear();

    /// Map to store total amount for each status
    totalAmount.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orders) {
      /// Count Orders
      final status = order.orderStatus;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      /// Calculate total amount for each status
      totalAmount[status] = (totalAmount[status] ?? 0) + order.totalAmount;
    }
  }

  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return "Pending";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.canceled:
        return "Canceled";
      case OrderStatus.shipped:
        return "Shipped";
      case OrderStatus.processing:
        return "Processing";
    }
  }
}
