import 'package:e_commerce_web/common/widgets/data_table/paginated_data_table.dart';
import 'package:e_commerce_web/features/shop/controller.dashboard/dashboard_controller.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/table/table_sources.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      availableRowsPerPage: [
        DashboardController.orders.length,
        DashboardController.orders.length + 1,
        DashboardController.orders.length + 2,
      ],
      rowsPerPage: DashboardController.orders.length,
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: TSizes.xl * 1.2,
      columns: const [
        DataColumn(label: Text("Order ID")),
        DataColumn(label: Text("Date")),
        DataColumn(label: Text("Items")),
        DataColumn(label: Text("Status")),
        DataColumn(label: Text("Amount")),
      ],
      source: OrderRows(),
    );
  }
}
