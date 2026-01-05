import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/table/data_table.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/dashboard_card.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/order_status_pie_chart.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/t_weekly_sales.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: TSizes.spaceBetweenItems),

              /// Cards
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TDashboardCard(
                      title: 'Sales Total',
                      height: 148,
                      width: 400,
                      radius: 10,
                      subtitle: '\$256.0',
                      icon: Iconsax.arrow_up_3,
                      state: 25,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBetweenItems),
                  Expanded(
                    child: TDashboardCard(
                      height: 148,
                      width: 400,
                      radius: 10,
                      title: 'Average Order Value',
                      subtitle: '\$25',
                      icon: Iconsax.arrow_up_3,
                      state: 15,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBetweenItems),
                  Expanded(
                    child: TDashboardCard(
                      height: 148,
                      width: 400,
                      radius: 10,
                      title: 'Total Orders',
                      subtitle: '36',
                      icon: Iconsax.arrow_up_3,
                      state: 44,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBetweenItems),
                  Expanded(
                    child: TDashboardCard(
                      height: 148,
                      width: 400,
                      radius: 10,
                      title: 'Visitors',
                      subtitle: '25,035',
                      icon: Iconsax.arrow_up_3,
                      state: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBetweenItems),

              /// Graphs
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// Bar Graph
                        TWeeklySalesWidget(width: 700),
                        SizedBox(height: TSizes.spaceBetweenItems),

                        /// Orders
                        TRoundedContainer(
                          radius: 10,
                          height: 500,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Recent Orders",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBetweenSections,
                                ),
                                const DashboardOrderTable(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: TSizes.sm),

                  /// Pie Chart
                  Expanded(child: OrderStatusPieChart(width: 850)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyProductData extends DataTableSource {
//   final DashboardController controller = Get.put(DashboardController());

//   @override
//   DataRow? getRow(int index) {
//     final data = controller.dataList[index];

//     return DataRow2(
//       onTap: () {
//         if (kDebugMode) {
//           print(index);
//         }
//       },
//       selected: controller.selectedRows[index],
//       onSelectChanged: (value) =>
//           controller.selectedRows[index] = value ?? false,

//       cells: [
//         DataCell(Text(data['Column 1'] ?? '')),
//         DataCell(Text(data['Column 2'] ?? '')),
//         DataCell(Text(data['Column 3'] ?? '')),
//         DataCell(Text(data['Column 4'] ?? '')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => controller.dataList.length;

//   @override
//   int get selectedRowCount => 0;
// }
