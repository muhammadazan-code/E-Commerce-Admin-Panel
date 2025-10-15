import 'package:e_commerce_web/features/dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // child: Table(
          //   border: TableBorder.all(),
          //   children: [
          //     TableRow(
          //       children: [
          //         TableCell(child: Text("Cell 1")),
          //         TableCell(child: Text("Cell 2")),
          //       ],
          //     ),
          //     TableRow(
          //       children: [
          //         TableCell(child: Text("Cell 3")),
          //         TableCell(child: Text("Cell 4")),
          //       ],
          //     ),
          //   ],
          // ),
          child: PaginatedDataTable2(
            columnSpacing: 12,
            minWidth: 786,
            rowsPerPage: 12,
            dividerThickness: 0,
            horizontalMargin: 12,
            dataRowHeight: 60,
            headingTextStyle: Theme.of(context).textTheme.titleLarge,
            headingRowColor: WidgetStateColor.resolveWith(
              (states) => TColor.primaryBackground,
            ),
            headingRowDecoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              ),
            ),
            showCheckboxColumn: true,
            border: TableBorder.all(color: Colors.black),
            columns: [
              DataColumn2(label: Text("Column 1")),
              DataColumn(label: Text("Column 2")),
              DataColumn(label: Text("Column 3")),
              DataColumn(label: Text("Column 4")),
            ],
            source: MyProductData(),
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
