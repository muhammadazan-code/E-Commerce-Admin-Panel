import 'package:e_commerce_web/common/widgets/container/t_circular_container.dart';
import 'package:e_commerce_web/features/shop/controller.dashboard/dashboard_controller.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/device/device_utilities.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class TWeeklySalesWidget extends StatelessWidget {
  const TWeeklySalesWidget({super.key, this.height = 400, this.width = 650});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return TCircularContainer(
      borderColor: TColor.darkGrey,
      showBorder: true,
      radius: 10,
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weekly Sales",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: TSizes.spaceBetweenSections),

            /// Graph
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  titlesData: buildFlTitlesData(),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                    ),
                  ),
                  gridData: FlGridData(show: true, horizontalInterval: 200),
                  barGroups: controller.weeklySales
                      .asMap()
                      .entries
                      .map(
                        (entry) => BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              toY: 100,
                              width: 30,
                              color: TColor.primaryColor,
                              borderRadius: BorderRadius.circular(TSizes.xs),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  groupsSpace: TSizes.spaceBetweenItems,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => TColor.secondary,
                    ),
                    touchCallback: TDeviceUtilities.isDesktopScreen(context)
                        ? (barTouchEvent, barTouchResponse) {}
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

FlTitlesData buildFlTitlesData() {
  return FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          /// Map index to the desired day of the week,
          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

          /// Calculate the index and ensure it wraps around for the correct day
          final index = value.toInt() % days.length;

          /// Get the day corresponding to the calculated index
          final day = days[index];
          return SideTitleWidget(space: 0, meta: meta, child: Text(day));
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50),
    ),
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );
}
