import 'package:flutter/material.dart';
import '../../../../../../../feature/models/work_space/work_space_spareparts.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';

class DataTableAccordionSpareparts extends StatelessWidget {
  DataTableAccordionSpareparts({super.key, required this.delete, required this.data});

  final Function delete;
  final List<String> _labelList = ['id', 'Malzeme', 'Miktar', 'İsim', 'Sil'];
  final List<WorkSpaceSpareparts> data;

  final String _nonKnownName = 'Bilinmiyor';
  final String _noAmount = 'Miktar Belirtilmemiş';

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
          for (var i = 0; i < _labelList.length; i++) ...{
            DataColumn(
              label: Text(
                _labelList[i],
                style: _cellTextStyle(),
              ),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < data.length; i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].name ?? _noAmount, style: _cellTextStyle())),
              DataCell(Text(data[i].amount ?? _nonKnownName, style: _cellTextStyle())),
              DataCell(Text(data[i].user ?? _nonKnownName, style: _cellTextStyle())),
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
