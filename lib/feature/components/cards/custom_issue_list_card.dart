// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/style/color_calculator.dart';
import 'package:vm_fm_4/core/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/core/constants/style/font_sizes.dart';
import 'package:vm_fm_4/feature/mixins/custom_issue_list_card_mixin.dart';

import '../../../core/constants/functions/null_check_widget.dart';
import '../../../core/constants/other/time_functions.dart';

class CustomIssueListCard extends StatefulWidget {
  final String? code,
      targetFDate,
      targetRDate,
      taskNo,
      description,
      sumdesc1,
      statusName,
      space,
      location,
      idate,
      statusCode,
      planedDate,
      respondedIDate,
      responseTimer,
      fixedTimer,
      fixedIDate,
      timeInfoNow;

  final Color? importanceLevelColor;
  final VoidCallback? press;
  final bool isIcon;
  final Function onPressed;
  final Function onPressedLong;

  const CustomIssueListCard(
      {Key? key,
      this.code,
      this.targetFDate,
      this.targetRDate,
      this.space,
      this.taskNo,
      this.description,
      this.sumdesc1,
      this.press,
      this.importanceLevelColor,
      this.statusName,
      this.isIcon = false,
      this.location,
      this.idate,
      this.statusCode,
      this.planedDate,
      required this.onPressed,
      this.respondedIDate,
      this.fixedTimer,
      this.responseTimer,
      this.fixedIDate,
      this.timeInfoNow,
      required this.onPressedLong})
      : super(key: key);

  @override
  State<CustomIssueListCard> createState() => _CustomIssueListCardState();
}

class _CustomIssueListCardState extends State<CustomIssueListCard> with CustomIssueListCardConstantsMixin, CustomIssueListCardStylesMixin {
  String dateNow = DateFormat("yyyyMMddhhmmss").format(DateTime.now());
  late final Timer _timer;

  void changeTime() {
    if (mounted) {
      setState(() {
        dateNow = DateFormat("yyyyMMddhhmmss").format(DateTime.now());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      changeTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => widget.onPressed(widget.code.toString()),
      onLongPress: () => widget.onPressedLong(),
      child: Container(
        width: size.width / 1.1,
        decoration: containerDecoration,
        child: Padding(
          padding: containerPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              codeWidget(size),
              statusNameWidget(size),
              NullCheckWidget().nullCheckWidget(
                widget.location.toString(),
                SizedBox(),
                issueListText(size, locationStr, widget.location.toString()),
              ),
              NullCheckWidget().nullCheckWidget(
                widget.space.toString(),
                SizedBox(),
                issueListText(size, placeStr, widget.space.toString()),
              ),
              NullCheckWidget().nullCheckWidget(
                widget.description.toString(),
                SizedBox(),
                issueListText(size, descriptionStr, widget.description.toString()),
              ),
              NullCheckWidget().nullCheckWidget(
                widget.idate.toString(),
                SizedBox(),
                issueListText(size, descriptionDateStr, widget.idate.toString()),
              ),
              widget.statusCode.toString() == statusCodeCheckTxt
                  ? plannedlWidget(size, widget.planedDate.toString())
                  : widget.responseTimer == zeroStr && widget.fixedTimer == zeroStr
                      ? Column(
                          children: [
                            happeningTimeWidget(size, happenedResponse, widget.respondedIDate.toString(), widget.targetRDate.toString()),
                            NullCheckWidget().nullCheckWidget(
                              widget.fixedIDate.toString(),
                              happeningTimeWidget(size, happenedDescriptionDaterError, numErrorStr, widget.targetFDate.toString()),
                              happeningTimeWidget(size, happenedFix, widget.fixedIDate.toString(), widget.targetFDate.toString()),
                            ),
                          ],
                        )
                      : widget.responseTimer == zeroStr && widget.fixedTimer == oneStr
                          ? Flexible(
                              child: Column(
                                children: [
                                  happeningTimeWidget(size, happenedResponse, widget.respondedIDate.toString(), widget.targetRDate.toString()),
                                  timerRecoverText(size, goalFix, widget.targetFDate.toString()),
                                  timerDifferenceText(size, remainDate, widget.targetFDate.toString()),
                                ],
                              ),
                            )
                          : Flexible(
                              child: Column(
                                children: [
                                  timerRecoverText(size, goalResponse, widget.targetRDate.toString()),
                                  timerDifferenceText(size, remainDate, widget.targetRDate.toString()),
                                  timerRecoverText(size, goalFix, widget.targetFDate.toString()),
                                  timerDifferenceText(size, remainDate, widget.targetFDate.toString()),
                                ],
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }

  Flexible plannedlWidget(Size size, plannedDate) {
    return Flexible(
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: CustomPaddings.onlyBottomLow,
          child: Text('$datedCase ${TimeClass().timeRecover(plannedDate)}', style: commonStyle),
        ),
      ),
    );
  }

  SizedBox happeningTimeWidget(Size size, String header, String fixedDate, String targetDate) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
          width: size.width,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomColorCalculator().colorCalculatorBackground(fixedDate, targetDate)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '$header ${TimeClass().timeRecover(fixedDate).toString()}',
              style: TextStyle(
                fontSize: FontSizes.caption - 1,
                letterSpacing: letterSpacing,
                color: CustomColorCalculator().colorCalculatorText(fixedDate, targetDate),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox timerDifferenceText(Size size, String header, String targetTime) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: CustomPaddings.topAndBottomLow,
        child: Text(
          key: Key(remainDateKey),
          '$header ${TimeClass().timeDifference(targetTime)}',
          style: TextStyle(
            color: CustomColorCalculator().colorCalculator(dateNow.toString(), targetTime),
            fontSize: FontSizes.caption - 1,
          ),
        ),
      ),
    );
  }

  SizedBox timerRecoverText(Size size, String header, String targetTime) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: CustomPaddings.topAndBottomLow,
        child: Text(
          key: Key(goalResponseKey),
          '$header ${TimeClass().timeRecover(targetTime)}',
          style: TextStyle(
            color: CustomColorCalculator().colorCalculator(dateNow.toString(), targetTime),
            fontSize: FontSizes.caption - 1,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }

  Flexible statusNameWidget(Size size) {
    return Flexible(
      child: SizedBox(
        width: size.width / 1,
        child: Padding(
          padding: CustomPaddings.onlyBottomLow,
          child: Text(widget.statusName.toString(), style: commonStyle),
        ),
      ),
    );
  }

  Flexible codeWidget(Size size) {
    return Flexible(
      child: SizedBox(
        width: size.width / 2.0,
        child: Padding(
          padding: CustomPaddings.onlyTopLow,
          child: Text(
            widget.code.toString(),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff025273), fontSize: FontSizes.caption, fontFamily: "Poppins", fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Flexible issueListText(Size size, String header, String description) {
    return Flexible(
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: CustomPaddings.onlyBottomLow,
                child: Text(key: Key(issueListTextKey), '$header : $description', style: commonStyle),
              ),
            ),
            Divider(height: 5),
          ],
        ),
      ),
    );
  }
}
