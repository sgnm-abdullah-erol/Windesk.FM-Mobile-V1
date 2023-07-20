import 'package:flutter/material.dart';
import '../dividers/custom_wo_summary_divider.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';
import '../../constants/style/custom_paddings.dart';
import '../../extensions/context_extension.dart';

import '../../models/work_space/work_space_appendings.dart';

class CustomUndetailPendingCard extends StatelessWidget {
  const CustomUndetailPendingCard({super.key, required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  final String _noDesc = 'Açıklama Yok';
  final String _noUserName = 'Kullanıcı Yok';
  final String _noStateName = 'Durum Yok';
  final String _noCreatedAtTime = 'Oluşturulma Tarihi Yok';
  final String _noReferenceId = 'Referans ID Yok';

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
              Text(workSpacePendiks.task?.description ?? _noDesc, style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.task?.user ?? _noUserName, style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.state?.name ?? _noStateName, style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workspace?.createdAt.toString() ?? '', style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workSpaceUserInformation?.createdAt.toString() ?? _noCreatedAtTime, style: _style()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.workSpaceUserInformation?.referenceId ?? _noReferenceId, style: _style()),
              const CustomWoSummaryDivider(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _style() {
    return TextStyle(
      color: APPColors.Main.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }
}
