import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/table/data_table.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/dashboard_card.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/order_status_pie_chart.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/widgets/t_weekly_sales.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = THelperFunctions.screenWidth(context);
    return Scaffold(
      backgroundColor: TColor.softGrey,
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
              SizedBox(height: TSizes.spaceBetweenItems),

              /// Cards
              TDashboardCard(
                height: 148,
                width: screenWidth,
                radius: 10,
                title: 'Sales Total',
                subtitle: '\$256.0',
                icon: Iconsax.arrow_up_3,
                state: 25,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              TDashboardCard(
                height: 148,
                width: screenWidth,
                radius: 10,
                title: 'Average Order Value',
                subtitle: '\$25',
                icon: Iconsax.arrow_up_3,
                state: 15,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              TDashboardCard(
                height: 148,
                width: screenWidth,
                radius: 10,
                title: 'Total Orders',
                subtitle: '36',
                icon: Iconsax.arrow_up_3,
                state: 44,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              TDashboardCard(
                title: 'Visitors',
                subtitle: '25,035',
                icon: Iconsax.arrow_up_3,
                height: 148,
                width: screenWidth,
                radius: 10,
                state: 2,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),

              /// Bar Graph
              const TWeeklySalesWidget(),
              const SizedBox(height: TSizes.spaceBetweenItems),

              ///Orders
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
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: TSizes.spaceBetweenSections),
                      const DashboardOrderTable(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBetweenItems),

              /// Pie Chart
              const OrderStatusPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}
