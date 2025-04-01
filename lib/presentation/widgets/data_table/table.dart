import 'package:client/global.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:client/presentation/widgets.dart';

class MyTableWidget extends StatelessWidget {
  final int rowsPerPage;
  final List<MyColumn> columns;
  final BaseTableData source;
  final int pageCount;
  final ValueChanged<int> onPageChanged;
  final void Function(dynamic)? onCellTap;

  const MyTableWidget({
    super.key,
    required this.rowsPerPage,
    required this.columns,
    required this.source,
    required this.pageCount,
    required this.onPageChanged,
    this.onCellTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(15),
            ),
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: AppTheme.mainColor2.withAlpha(180),
                gridLineColor: Theme.of(context).primaryColor.withAlpha(30),
              ),
              child: SfDataGrid(
                source: SyncfusionTableAdapter(data: source, onTap: onCellTap),
                allowColumnsResizing: true,
                columnResizeMode: ColumnResizeMode.onResize,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.none,
                onCellTap: (f) {
                  return onCellTap!(f);
                },
                columns:
                    columns
                        .map(
                          (col) => GridColumn(
                            width: col.width,
                            columnWidthMode: ColumnWidthMode.fill,
                            columnName: col.name,
                            minimumWidth: 50,
                            label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text(
                                col.title,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ),
        Container(
          color: Theme.of(context).primaryColorDark.withAlpha(55),
          child: SfDataPagerTheme(
            data: SfDataPagerThemeData(
              selectedItemColor: AppTheme.mainColor2,
              selectedItemTextStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.transparent,
            ),
            child: SfDataPager(
              visibleItemsCount: 10,
              delegate: SyncfusionTableAdapter(data: source),
              availableRowsPerPage: const <int>[15, 20, 25],
              pageCount: pageCount.toDouble(),
              onPageNavigationEnd: (pageIndex) {
                onPageChanged(pageIndex);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyColumn {
  final String title;
  final String name;
  final bool isVisible;
  final double width;

  const MyColumn({
    required this.title,
    required this.name,
    this.isVisible = true,
    this.width = double.nan,
  });
}
