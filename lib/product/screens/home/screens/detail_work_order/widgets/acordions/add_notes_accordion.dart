import 'package:accordion/accordion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_notes_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/tables/data_table_added_notes.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/work_order_detail_provider.dart';
import '../../provider/work_order_detail_service_provider.dart';

class AddNotesAccordion extends StatelessWidget {
  const AddNotesAccordion({super.key, required this.provider});

  final WorkOrderDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: APPColors.Accent.black,
      children: [
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          isOpen: false,
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddNotes, style: context.labelMedium.copyWith(color: APPColors.Main.white)).tr(),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () async {
            ShowModalBottomSheet().show(
              context,
              AddNotesModalBottomSheet(taskId: provider.detail.task?.id.toString() ?? '0', function: () {}),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          isOpen: false,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.note, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddedNotes.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          onOpenSection: () {
            Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedNotesFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: ((context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedNotes
                    ? value.isNotesFetched
                        ? null
                        : value.fetchNotes(provider.detail.task?.id.toString() ?? '')
                    : null;
              });

              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAcordionNotes(
                      provider: value,
                      data: value.workSpaceNotes,
                    );
            }),
          ),
        )
      ],
    );
  }
}
