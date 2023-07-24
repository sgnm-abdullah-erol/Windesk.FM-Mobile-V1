import 'package:flutter/material.dart';
import '../../../../../../feature/constants/other/colors.dart';

import '../../../../../../feature/constants/other/app_icons.dart';

class DataTableAccordion extends StatelessWidget {
  const DataTableAccordion({super.key, required this.delete, required this.data, required this.labelList});

  final Function delete;
  final List<String> labelList;
  final dynamic data;

  final String _nonKnownName = 'Bilinmiyor';
  final String _noEffortType = 'Çalışma Türü Belirtilmemiş';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 1,
        showBottomBorder: true,
        horizontalMargin: 0,
        columns: [
          for (var i = 0; i < labelList.length; i++) ...{
            DataColumn(
              label: Text(
                labelList[i],
                style: _cellTextStyle(),
              ),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < (data == null ? 0 : data!.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].effortType ?? _noEffortType, style: _cellTextStyle())),
              DataCell(Text(data[i].user ?? _nonKnownName, style: _cellTextStyle())),
              DataCell(Text(data[i].effortDuration.toString(), style: _cellTextStyle())),
              DataCell(
                IconButton(
                  onPressed: () => delete(),
                  icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                ),
              ),
            ]),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle() {
    return const TextStyle(color: Colors.black);
  }
}
