import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../feature/extensions/context_extension.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/models/work_space/work_space_requirement_materials_list.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class DataTableAccordionRequstedMaterials extends StatelessWidget {
  DataTableAccordionRequstedMaterials({super.key, required this.delete, required this.data});

  final Function delete;
  final List<String> _labelList = [
    LocaleKeys.DataTableID.tr(),
    LocaleKeys.DataTableName.tr(),
    LocaleKeys.DataTableUnit.tr(),
    LocaleKeys.DataTableAmount.tr(),
    LocaleKeys.DataTableUser.tr(),
    LocaleKeys.DataTableTotalAmount.tr(),
    LocaleKeys.DataTableDelete.tr(),
  ];

  final List<WorkSpaceRequirementMaterialsList> data;

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
          for (var i = 0; i < (data.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].name ?? "", style: _cellTextStyle(context))),
              DataCell(Text(data[i].measurementUnit ?? "", style: _cellTextStyle(context))),
              DataCell(Text(data[i].amount.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].user.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].totalAmount.toString(), style: _cellTextStyle(context))),
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

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
