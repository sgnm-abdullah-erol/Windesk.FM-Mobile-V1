import 'package:flutter/material.dart';

import '../../../core/constants/functions/null_check_widget.dart';
import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
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
                  _workSpaceDetailName(),
                  _workSpaceDetailText(),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.state?.isActive.toString() ?? '',
                    Container(),
                    woSummaryTextWidget(
                      Icons.navigation_rounded,
                      workSpaceDetail.state?.isActive.toString() ?? '',
                    ),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.id.toString() ?? '',
                    Container(),
                    woSummaryTextWidget(
                      Icons.apartment_outlined,
                      workSpaceDetail.task?.id.toString() ?? '',
                    ),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.name ?? '',
                    Container(),
                    woSummaryTextWidget(
                      Icons.apartment_outlined,
                      workSpaceDetail.task?.name ?? '',
                    ),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.createdBy?.name ?? '',
                    Container(),
                    woSummaryTextWidget(
                      Icons.apartment_outlined,
                      workSpaceDetail.task?.createdBy?.name ?? '',
                    ),
                  ),
                  NullCheckWidget().nullCheckWidget(
                    workSpaceDetail.task?.owner ?? '',
                    Container(),
                    woSummaryTextWidget(
                      Icons.person_outline,
                      workSpaceDetail.task?.owner ?? '',
                    ),
                  ),
                  _workSpaceCreatedDate(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _workSpaceCreatedDate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(workSpaceDetail.task?.createdAt.toString() ?? '', style: TextStyle(color: APPColors.Main.black)),
      ),
    );
  }

  Padding _workSpaceDetailName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          workSpaceDetail.task?.name ?? '',
          style: TextStyle(color: APPColors.Main.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding _workSpaceDetailText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(workSpaceDetail.task?.description ?? '', style: TextStyle(color: APPColors.Main.black)),
      ),
    );
  }

  Padding woSummaryTextWidget(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(color: APPColors.Main.black),
            ),
          ],
        ),
      ),
    );
  }
}


 // woModel.plannedTime == null
              //     ? Container()
              //     : const Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Align(
              //           alignment: Alignment.topLeft,
              //           child: Row(
              //             children: [
              //               Icon(Icons.watch_later_outlined),
              //               // Text(
              //               //   convertSecToStringFormat(woModel.plannedTime.toString()).toString(),
              //               //   style: TextStyle(color: APPColors.Main.black),
              //               // ),
              //             ],
              //           ),
              //         ),
              //       ),
              // woModel.plannedStartdate == null
              //     ? Container()
              //     : const Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Align(
              //           alignment: Alignment.topLeft,
              //           child: Row(
              //             children: [
              //               Icon(Icons.watch_later_outlined),
              //               // Text(
              //               //   '${woDetailList.PLANNED_STARTDATE.toString()} --> ${woDetailList.PLANNED_ENDDATE.toString()} ',
              //               //   style: TextStyle(color: APPColors.Main.black),
              //               // ),
              //             ],
              //           ),
              //         ),
              //       ),
