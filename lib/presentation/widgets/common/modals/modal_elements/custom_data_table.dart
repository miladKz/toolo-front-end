import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/common/abstracts/table_row_data_abs.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';
import '../../../../view_models/table_view_model.dart';

class CustomDataTable extends StatefulWidget {
  CustomDataTable(
      {super.key,
      required this.viewModel,
      this.onTap,
      this.onDoubleTap,
      this.backgroundColor = Colors.white});

  /// Row tap handler, won't be called if tapped cell has any tap event handlers
  final Function(ITableRowData)? onTap;
  Color backgroundColor;

  /// Row double tap handler, won't be called if tapped cell has any tap event handlers
  final Function(ITableRowData)? onDoubleTap;
  DataTableViewModel viewModel;
  ITableRowData? selectedItem;

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  int? sortColumnIndex;
  bool isAscending = false;
  double tableRowHeight = 45.0;

  @override
  Widget build(BuildContext context) {
  /*  print(
        'viewModel in data table size======>>>>props.length= ${widget.viewModel.data[0].props.length} and lable.length= ${widget.viewModel.labels.length}');
*/
    final List<DataColumn> columns = widget.viewModel.labels
        .map((label) => DataColumn2(
            label: Text(label, overflow: TextOverflow.ellipsis, maxLines: 1),
            tooltip: label,
            size: ColumnSize.M,
            onSort: onSort))
        .toList();
    final List<DataRow2> rows = widget.viewModel.data.map((dataItem) {
      final List<DataCell> cells = dataItem.props.map((prop) {
        return DataCell(
          Text(
            '$prop',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      }).toList();

      return DataRow2(
        cells: cells,
        selected: widget.selectedItem == dataItem,
        onTap: () {
          setSelectedItem(dataItem);

          if (widget.onTap != null) {
            widget.onTap!(dataItem);
          }
        },
        onDoubleTap: () {
          if (widget.onDoubleTap != null) {
            widget.onDoubleTap!(dataItem);
          }
        },
      );
    }).toList();
    double tableHeight =
        ((widget.viewModel.data.length + 1) * tableRowHeight).clamp(0.0, 330.0);

    return SizedBox(
      height: tableHeight,
      child: DataTable2(
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(5)),
          dataTextStyle:
              const TextStyle(color: Color(0xFF7F868D), fontSize: 10),
          dataRowHeight: tableRowHeight,
          sortColumnIndex: sortColumnIndex,
          sortAscending: isAscending,
          headingRowHeight: tableRowHeight,
          showCheckboxColumn: false,
          dividerThickness: 0,
          border: const TableBorder(
              bottom: BorderSide(
            width: 1,
            color: Color(0xFFDEE2E6),
          )),
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 800,
          columns: columns,
          rows: rows),
    );
  }

  void setSelectedItem(ITableRowData dataItem) {
    setState(() {
      widget.selectedItem = dataItem;
      selectItem(dataItem);
    });
  }

  void onSort(int columnIndex, bool isAscending) {
    setState(() {
      widget.viewModel.data.sort((value1, value2) => compareString(
          isAscending,
          value1.props[columnIndex].toString(),
          value2.props[columnIndex].toString()));
      sortColumnIndex = columnIndex;
      this.isAscending = isAscending;
    });
  }

  int compareString(bool isAscending, String value1, String value2) {
    return isAscending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  void selectItem(ITableRowData data) {
    locator.get<MainBloc>().add(OnClickOnTableRowData(data));
  }
}
