import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/edit_note_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_note.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../core/enums/task_node_enums.dart';
import '../../../../../../../feature/components/alert_dialog/work_order_delete_item_alert_dialog.dart';
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
    LocaleKeys.Edit.tr(),
    LocaleKeys.Delete.tr(),
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
            DataRow(
              cells: [
                DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
                DataCell(Text(data[i].note?.replaceAll("<p>", '').replaceAll("</p>", "") ?? "", style: _cellTextStyle(context))),
                DataCell(
                  IconButton(
                    onPressed: () async {
                      ShowModalBottomSheet().show(
                        context,
                        EditNoteModalBottomSheet(
                          taskId: provider.detail.task?.id.toString() ?? '',
                          labelId: data[i].id.toString(),
                          hint: data[i].note?.replaceAll("<p>", '').replaceAll("</p>", "") ?? '',
                        ),
                      );
                    },
                    icon: Icon(AppIcons.edit, color: APPColors.Login.green),
                  ),
                ),
                DataCell(
                  IconButton(
                    onPressed: () async {
                      final response = await WorkOrderDeleteItemAlertDialog.deleteWorkOrderAlertDialog(
                        context,
                        DeleteItemType.note,
                        int.tryParse(data[i].id.toString()) ?? 0,
                      );

                      if (response == true) {
                        // ignore: use_build_context_synchronously
                        provider.deleteNode(context, data[i].id.toString(), provider.detail.task?.id.toString() ?? '', TaskNodeEnums.note);
                      }
                    },
                    icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                  ),
                ),
              ],
            ),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
