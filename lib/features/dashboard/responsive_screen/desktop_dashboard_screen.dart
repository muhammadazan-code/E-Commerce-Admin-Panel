import 'package:e_commerce_web/common/widgets/data_table/paginated_data_table.dart';
import 'package:e_commerce_web/features/dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchTextController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Iconsax.search_normal),
                ),
                onChanged: (value) => controller.searchQuery(value),
              ),
              SizedBox(height: TSizes.spaceBetweenSections),
              Obx(() {
                Visibility(
                  visible: false,
                  child: Text(controller.filteredDataList.length.toString()),
                );
                return TPaginatedDataTable(
                  minWidth: 786,
                  rowsPerPage: 12,
                  dataRowHeight: 60,

                  /// Pagination
                  onPageChanged: (value) {
                    if (kDebugMode) {
                      print("pAGE cHANGED");
                    }
                  },

                  /// SORTING
                  sortAscending: controller.sortAscending.value,
                  sortColumnIndex: controller.sortColumnIndex.value,
                  columns: [
                    DataColumn2(label: Text("Column 1")),
                    DataColumn(
                      label: Text("Column 2"),
                      onSort: (columnIndex, ascending) =>
                          controller.sortById(columnIndex, ascending),
                    ),
                    DataColumn(label: Text("Column 3")),
                    DataColumn(
                      label: Text("Column 4"),
                      onSort: (columnIndex, ascending) =>
                          controller.sortById(columnIndex, ascending),
                    ),
                  ],
                  source: MyProductData(),
                );
              }),
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
