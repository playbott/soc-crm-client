import 'package:client/presentation/ui/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

abstract class BaseTableData<T> {
  final List<T> data;
  final int totalCount;
  final int offset;
  final int pageSize;
  final BuildContext context;
  late List<BaseTableRow> _rows;

  BaseTableData({
    required this.data,
    required this.totalCount,
    required this.offset,
    required this.pageSize,
    required this.context,
  }) {
    _rows = data.map<BaseTableRow>(buildRow).toList();
  }

  BaseTableRow buildRow(T item);

  List<BaseTableRow> get rows => _rows;
}

class BaseTableRow extends DataGridRow {
  BaseTableRow({required this.id, required super.cells});

  final int? id;
}

class BaseTableCell<T> extends DataGridCell {
  BaseTableCell({required super.columnName, required super.value, this.rowId});

  final int? rowId;
}

class SyncfusionTableAdapter extends DataGridSource {
  final BaseTableData data;
  late List<DataGridRow> _rows;
  final Function(dynamic)? onTap;

  SyncfusionTableAdapter({required this.data, this.onTap}) {
    _rows =
        data.rows
            .map(
              (row) => BaseTableRow(
                id: row.id,
                cells:
                    row
                        .getCells()
                        .map(
                          (cell) => BaseTableCell<dynamic>(
                            columnName: cell.columnName,
                            value: cell.value,
                            rowId: row.id,
                          ),
                        )
                        .toList(),
              ),
            )
            .toList();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    var cells = (row.getCells() as List<BaseTableCell>);
    return DataGridRowAdapter(
      cells: List.generate(cells.length, (index) {
        return InkWell(
          onTap:
              onTap != null
                  ? () {
                    onTap!(cells[index].rowId);
                  }
                  : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cells[index].value.toString(),
                    style: TextStyle(fontSize: FS.p7),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
