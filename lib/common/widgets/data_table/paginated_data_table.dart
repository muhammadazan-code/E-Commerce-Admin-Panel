import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_web/common/widgets/loaders/animation_loaders.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.sortColumnIndex,
    required this.columns,
    this.rowsPerPage = 13,
    this.onPageChanged,
    required this.source,
    this.minWidth = 1000,
    this.tableHeight = 760,
    this.dataRowHeight = TSizes.xl + 2,
  });

  final bool sortAscending;
  final int? sortColumnIndex;
  final List<DataColumn> columns;
  final int? rowsPerPage;
  final Function(int)? onPageChanged;
  final DataTableSource source;
  final double minWidth;
  final double tableHeight;
  final double dataRowHeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: tableHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
            cardTheme: CardThemeData(color: TColor.white, elevation: 23),
          ),
          child: PaginatedDataTable2(
            empty: TAnimationLoaderWidgets(
              text: 'Nothing Found',
              animation: TImagePath.docerAnimation,
            ),
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

            /// CheckBox Column
            showCheckboxColumn: true,

            /// Pagination
            showFirstLastButtons: true,
            onPageChanged: onPageChanged,
            renderEmptyRowsInTheEnd: true,
            // onRowsPerPageChanged: (noOfRows) {},
            border: TableBorder.all(color: Colors.black),

            /// SORTING
            sortArrowBuilder: (ascending, sorted) {
              if (sorted) {
                return Icon(
                  ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                  size: TSizes.iconSm,
                );
              } else {
                return Icon(Iconsax.arrow_3, size: TSizes.iconSm);
              }
            },
            sortAscending: sortAscending,
            sortArrowAlwaysVisible: true,
            sortArrowIcon: Icons.line_axis,
            sortColumnIndex: sortColumnIndex,
            columns: columns,
            source: source,
          ),
        ),
      ),
    );
  }
}
