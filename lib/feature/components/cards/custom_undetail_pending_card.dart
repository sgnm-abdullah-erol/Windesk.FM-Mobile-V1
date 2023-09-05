import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/custom_paddings.dart';
import '../../../generated/locale_keys.g.dart';
import '../../extensions/context_extension.dart';
import '../../models/work_space/work_space_appendings.dart';
import '../dividers/custom_wo_summary_divider.dart';

class CustomUndetailPendingCard extends StatelessWidget {
  const CustomUndetailPendingCard({super.key, required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: CustomBorderRadius.mediumBorderRadius,
          side: BorderSide(color: APPColors.Main.grey, width: 0.5),
        ),
        elevation: 8,
        child: Padding(
          padding: CustomPaddings.pageHigh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('WO ${workSpacePendiks.task?.id.toString() ?? 0} ${workSpacePendiks.task?.name ?? ''}', style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.task?.description ?? LocaleKeys.NoName.tr(), style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.task?.user ?? LocaleKeys.NoName.tr(), style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.state?.name ?? LocaleKeys.NoState.tr(), style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workspace?.createdAt.toString() ?? LocaleKeys.NoCreatedAtTime.tr(), style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workSpaceUserInformation?.createdAt.toString() ?? LocaleKeys.NoCreatedAtTime.tr(), style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workSpaceUserInformation?.referenceId ?? LocaleKeys.NoReferenceId.tr(), style: _style()),
              const CustomWoSummaryDivider(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _style() => TextStyle(color: APPColors.Main.black, fontSize: 16, fontWeight: FontWeight.bold);
}
