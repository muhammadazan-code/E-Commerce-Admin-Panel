import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var dataList = <Map<String, String>>[].obs;
  var filteredDataList = <Map<String, String>>[].obs;

  /// Observable list to store selected rows
  RxList<bool> selectedRows = <bool>[].obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  final searchTextController =
      TextEditingController(); // Controller for handling search text input

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    dataList.sort((a, b) {
      if (ascending) {
        return dataList[0]['Column 1'].toString().toLowerCase().compareTo(
          dataList[0]['Column 1'].toString().toLowerCase(),
        );
      } else {
        return dataList[0]['Column 1'].toString().toLowerCase().compareTo(
          dataList[0]['Column 1'].toString().toLowerCase(),
        );
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where((item) => item['Column 1']!.contains(query.toLowerCase())),
    );
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(36, (index) => false));

    dataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column 1': 'Data ${index + 1} -1',
          'Column 2': 'Data ${index + 1} - 2',
          'Column 3': 'Data ${index + 1} - 3',
          'Column 4': 'Data ${index + 1} - 4',
        },
      ),
    );
    filteredDataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column 1': 'Data ${index + 1} -1',
          'Column 2': 'Data ${index + 1} - 2',
          'Column 3': 'Data ${index + 1} - 3',
          'Column 4': 'Data ${index + 1} - 4',
        },
      ),
    );
  }
}
