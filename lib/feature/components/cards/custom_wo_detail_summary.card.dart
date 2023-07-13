import 'package:flutter/material.dart';
import '../../constants/functions/null_check_widget.dart';
import '../../models/work_order_models/work_order_details_model.dart';

import '../../constants/other/colors.dart';

class WoSummary extends StatelessWidget {
  const WoSummary({super.key, required this.woModel});

  final WorkOrderDetailsModel woModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: Column(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  woModel.name.toString(),
                  style: TextStyle(color: APPColors.Main.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  woModel.description.toString(),
                  style: TextStyle(color: APPColors.Main.black),
                ),
              ),
            ),
            NullCheckWidget()
                .nullCheckWidget(woModel.priority, Container(), woSummaryTextWidget(Icons.navigation_rounded, woModel.priority.toString())),
            NullCheckWidget()
                .nullCheckWidget(woModel.modulecode, Container(), woSummaryTextWidget(Icons.apartment_outlined, woModel.modulecode.toString())),
            NullCheckWidget()
                .nullCheckWidget(woModel.modulename, Container(), woSummaryTextWidget(Icons.apartment_outlined, woModel.modulename.toString())),
            NullCheckWidget()
                .nullCheckWidget(woModel.responsible, Container(), woSummaryTextWidget(Icons.apartment_outlined, woModel.responsible.toString())),
            NullCheckWidget().nullCheckWidget(woModel.iuser, Container(), woSummaryTextWidget(Icons.person_outline, woModel.iuser.toString())),
            NullCheckWidget().nullCheckWidget(woModel.iuser, Container(), woSummaryTextWidget(Icons.person_outline, woModel.iuser.toString())),
            woModel.plannedTime == null
                ? Container()
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          // Text(
                          //   convertSecToStringFormat(woModel.plannedTime.toString()).toString(),
                          //   style: TextStyle(color: APPColors.Main.black),
                          // ),
                        ],
                      ),
                    ),
                  ),
            woModel.plannedStartdate == null
                ? Container()
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          // Text(
                          //   '${woDetailList.PLANNED_STARTDATE.toString()} --> ${woDetailList.PLANNED_ENDDATE.toString()} ',
                          //   style: TextStyle(color: APPColors.Main.black),
                          // ),
                        ],
                      ),
                    ),
                  ),
          ]),
        ],
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

mymCheck(woCode) {
  if (woCode[0] == 'M') {
    return true;
  } else {
    return false;
  }
}
