import 'package:flutter/material.dart';

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
          child: DataTable(
            decoration: BoxDecoration(color: Colors.white),
            border: TableBorder.all(color: Colors.black),
            columns: [
              DataColumn(label: Text("Column 1")),
              DataColumn(label: Text("Column 2")),
              DataColumn(label: Text("Column 3")),
              DataColumn(label: Text("Column 4")),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text("Row 1")),
                  DataCell(Text("Row 2")),
                  DataCell(Text("Row 3")),
                  DataCell(Text("Row 4")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("Row 5")),
                  DataCell(Text("Row 6")),
                  DataCell(Text("Row 7")),
                  DataCell(Text("Row 8")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
