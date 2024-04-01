import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/common/abstracts/table_row_data.dart';
import '../../../../view_models/table_view_model.dart';

class SelectableDataTable extends StatefulWidget {
  SelectableDataTable({super.key, required this.viewModel});

  TableViewModel viewModel;

  @override
  State<SelectableDataTable> createState() => _SelectableDataTableState();
}

class _SelectableDataTableState extends State<SelectableDataTable> {
  TableRowData? selectedItem;
  int? sortColumnIndex;
  bool isAscending = false;
  double tableRowHeight = 45.0;

  @override
  Widget build(BuildContext context) {
    final List<DataColumn> columns = widget.viewModel.labels
        .map((label) => DataColumn2(label: Text(label), onSort: onSort))
        .toList();
    final List<DataRow2> rows = widget.viewModel.data.map((dataItem) {
      final List<DataCell> cells = dataItem.props.map((prop) {
        return DataCell(Text('$prop'));
      }).toList();

      return DataRow2(
        cells: cells,
        selected: selectedItem == dataItem,
        onSelectChanged: (value) {
          setState(() {
            selectedItem = dataItem;
          });
        },
      );
    }).toList();

    return SizedBox(
      height: ((widget.viewModel.data.length + 1) * tableRowHeight),
      child: DataTable2(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          dataTextStyle: const TextStyle(color: Color(0xFF7F868D)),
          dataRowHeight: tableRowHeight,
          sortColumnIndex: sortColumnIndex,
          sortAscending: isAscending,
          headingRowHeight: tableRowHeight,
          dividerThickness: 0,
          showCheckboxColumn: false,
          border: const TableBorder(
              bottom: BorderSide(
            width: 1,
            color: Color(0xFFDEE2E6),
          )),
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: columns,
          rows: rows),
    );
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
}
