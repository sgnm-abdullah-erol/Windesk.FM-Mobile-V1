import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_note.dart';

import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/work_order_detail_service_provider.dart';

class DataTableAcordionNotes extends StatelessWidget {
  DataTableAcordionNotes({super.key, required this.data, required this.provider});

  final List<WorkSpaceNote> data;
  final WorkOrderDetailServiceProvider provider;

  final List<String> _labelList = [
    LocaleKeys.DataTableID.tr(),
    LocaleKeys.Notes.tr(),
  ];

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
              label: Text(_labelList[i], style: _cellTextStyle(context)),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < data.length; i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].note?.replaceAll("<p>", '').replaceAll("</p>", "") ?? "", style: _cellTextStyle(context))),
            ]),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
