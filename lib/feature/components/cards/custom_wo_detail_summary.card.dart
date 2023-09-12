import 'package:flutter/material.dart';

import '../../../core/constants/functions/null_check_widget.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';
import '../../models/work_space/work_space_detail.dart';

class WoSummary extends StatelessWidget {
  const WoSummary({super.key, required this.workSpaceDetail});

  final WorkSpaceDetail workSpaceDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: Card(
        color: Colors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  _workSpaceDetailName(context),
                  _workSpaceDetailText(context),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.state?.isActive.toString() ?? '',
                    Container(),
                    woSummaryTextWidget(context, Icons.navigation_rounded, workSpaceDetail.state?.isActive.toString() ?? ''),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.id.toString() ?? '',
                    Container(),
                    woSummaryTextWidget(context, Icons.apartment_outlined, workSpaceDetail.task?.id.toString() ?? ''),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.name ?? '',
                    Container(),
                    woSummaryTextWidget(context, Icons.apartment_outlined, workSpaceDetail.task?.name ?? ''),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.createdBy?.name ?? '',
                    Container(),
                    woSummaryTextWidget(context, Icons.apartment_outlined, workSpaceDetail.task?.createdBy?.name ?? ''),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.owner ?? '',
                    Container(),
                    woSummaryTextWidget(context, Icons.person_outline, workSpaceDetail.task?.owner ?? ''),
                  ),
                  _workSpaceCreatedDate(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _workSpaceCreatedDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(workSpaceDetail.task?.createdAt.toString() ?? '', style: context.bodyMedium),
      ),
    );
  }

  Padding _workSpaceDetailName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(workSpaceDetail.task?.name ?? '', style: context.bodyMedium),
      ),
    );
  }

  Padding _workSpaceDetailText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(workSpaceDetail.task?.description ?? '', style: context.bodyMedium),
      ),
    );
  }

  Padding woSummaryTextWidget(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Icon(icon),
            Text(text, style: context.bodyMedium),
          ],
        ),
      ),
    );
  }
}
