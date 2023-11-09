import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_order_models/delivered_spare_of_model.dart';

import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/work_order_detail_service_provider.dart';

class DataTableAccordionApprovedRequstedMaterials extends StatelessWidget {
  DataTableAccordionApprovedRequstedMaterials({super.key, required this.data, required this.provider});

  final WorkOrderDetailServiceProvider provider;

  final List<String> _labelList = [
    LocaleKeys.DataTableID.tr(),
    LocaleKeys.DataTableName.tr(),
    LocaleKeys.DataTableUnit.tr(),
    LocaleKeys.DataTableAmount.tr(),
    LocaleKeys.DataTableUser.tr(),
  ];

  final List<DeliveredSpareOfModel> data;

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
            DataRow(
              cells: [
                DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
                DataCell(Text(data[i].name ?? "", style: _cellTextStyle(context))),
                DataCell(Text(data[i].measurementUnit ?? "", style: _cellTextStyle(context))),
                DataCell(Text(data[i].amount.toString(), style: _cellTextStyle(context))),
                DataCell(Text(data[i].user.toString(), style: _cellTextStyle(context))),
              ],
            ),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
