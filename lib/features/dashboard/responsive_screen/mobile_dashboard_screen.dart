import 'package:e_commerce_web/features/dashboard/widgets/dashboard_card.dart';
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
              TDashboardCard(
                height: 184,
                width: screenWidth,
                radius: 10,
                title: 'Sales Total',
                subtitle: '\$256.0',
                icon: Iconsax.arrow_up_3,
                state: 25,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              TDashboardCard(
                height: 184,
                width: screenWidth,
                radius: 10,
                title: 'Average Order Value',
                subtitle: '\$25',
                icon: Iconsax.arrow_up_3,
                state: 15,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              TDashboardCard(
                height: 184,
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
                height: 184,
                width: screenWidth,
                radius: 10,
                state: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
