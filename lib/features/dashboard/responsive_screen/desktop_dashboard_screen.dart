import 'package:e_commerce_web/features/dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_web/features/dashboard/widgets/dashboard_card.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: TSizes.spaceBetweenSections),

              /// Cards
              Row(
                children: [
                  Expanded(
                    child: TDashboardCard(
                      title: 'Sales Total',
                      height: 184,
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
                      height: 184,
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
                      height: 184,
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
                      height: 184,
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
            ],
          ),
        ),
      ),
    );
  }
}

class MyProductData extends DataTableSource {
  final DashboardController controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.dataList[index];

    return DataRow2(
      onTap: () {
        if (kDebugMode) {
          print(index);
        }
      },
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,

      cells: [
        DataCell(Text(data['Column 1'] ?? '')),
        DataCell(Text(data['Column 2'] ?? '')),
        DataCell(Text(data['Column 3'] ?? '')),
        DataCell(Text(data['Column 4'] ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.dataList.length;

  @override
  int get selectedRowCount => 0;
}

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.rightSideWidth,
    required this.title,
  });
  final Color? textColor;
  final Widget? rightSideWidth;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (rightSideWidth != null) rightSideWidth!,
      ],
    );
  }
}
