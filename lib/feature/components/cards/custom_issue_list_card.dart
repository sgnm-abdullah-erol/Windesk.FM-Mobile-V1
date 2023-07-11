// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/style/border_radius.dart';
import 'package:vm_fm_4/feature/constants/style/color_calculator.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/constants/style/font_sizes.dart';

import '../../constants/functions/null_check_widget.dart';
import '../../constants/other/colors.dart';
import '../../constants/other/time_functions.dart';

class TaskListWidget extends StatefulWidget {
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

  const TaskListWidget(
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
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
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
        decoration: BoxDecoration(
          borderRadius: CustomBorderRadius.mediumBorderRadius,
          boxShadow: [BoxShadow(color: Color(0x19025273), blurRadius: 50, offset: Offset(6, 8))],
          color: APPColors.Main.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              codeWidget(size),
              statusNameWidget(size),
              NullCheckWidget().nullCheckWidget(widget.location.toString(), Container(), issueListText(size, 'Lokasyon', widget.location.toString())),
              NullCheckWidget().nullCheckWidget(widget.space.toString(), Container(), issueListText(size, 'Mahal', widget.space.toString())),
              NullCheckWidget()
                  .nullCheckWidget(widget.description.toString(), Container(), issueListText(size, 'Açıklama', widget.description.toString())),
              NullCheckWidget().nullCheckWidget(widget.idate.toString(), Container(), issueListText(size, 'Açılma Tarihi', widget.idate.toString())),
              widget.statusCode.toString() == "OPlanned"
                  ? plannedlWidget(size, widget.planedDate.toString())
                  : widget.responseTimer == "0" && widget.fixedTimer == "0"
                      ? Column(
                          children: [
                            happeningTimeWidget(size, 'Gerçekleşen Yanıtlama : ', widget.respondedIDate.toString(), widget.targetRDate.toString()),
                            NullCheckWidget().nullCheckWidget(
                              widget.fixedIDate.toString(),
                              happeningTimeWidget(size, 'Düzeltme tarihine ulaşılamadı : ', '5000000000000000', widget.targetFDate.toString()),
                              happeningTimeWidget(size, 'Gerçekleşen Düzeltme', widget.fixedIDate.toString(), widget.targetFDate.toString()),
                            ),
                          ],
                        )
                      : widget.responseTimer == "0" && widget.fixedTimer == "1"
                          ? Flexible(
                              child: Column(
                                children: [
                                  happeningTimeWidget(
                                      size, 'Gerçekleşen Yanıtlama : ', widget.respondedIDate.toString(), widget.targetRDate.toString()),
                                  timerRecoverText(size, 'Hedef Düzeltme ', widget.targetFDate.toString()),
                                  timerDifferenceText(size, 'Kalan Süreniz', widget.targetFDate.toString()),
                                ],
                              ),
                            )
                          : Flexible(
                              child: Column(
                                children: [
                                  timerRecoverText(size, 'Hedef Yanıtlama ', widget.targetRDate.toString()),
                                  timerDifferenceText(size, 'Kalan Süreniz', widget.targetRDate.toString()),
                                  timerRecoverText(size, 'Hedef Düzeltme ', widget.targetFDate.toString()),
                                  timerDifferenceText(size, 'Kalan Süreniz', widget.targetFDate.toString()),
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
        width: size.width / 1,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Randevulu Vaka ${TimeClass().timeRecover(plannedDate)}',
            style: TextStyle(
              color: Color(0xff025273),
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox happeningTimeWidget(Size size, String header, String fixedDate, String targetDate) {
    return SizedBox(
      width: size.width / 1,
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
                  fontSize: 13,
                  letterSpacing: 0.5,
                  color: CustomColorCalculator().colorCalculatorText(fixedDate, targetDate),
                  fontWeight: FontWeight.bold),
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
          key: Key('kalanSüreniz'),
          '$header ${TimeClass().timeDifference(targetTime)}',
          style: TextStyle(
            color: CustomColorCalculator().colorCalculator(dateNow.toString(), targetTime),
            fontSize: 13,
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
          key: Key('Hedef Yanıtlama'),
          '$header ${TimeClass().timeRecover(targetTime)}',
          style: TextStyle(
            color: CustomColorCalculator().colorCalculator(dateNow.toString(), targetTime),
            fontSize: 13,
            letterSpacing: 0.5,
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
          child: Text(
            widget.statusName.toString(),
            style: TextStyle(
              color: Color(0xff025273),
              fontSize: FontSizes.caption - 1,
            ),
          ),
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
                child: Text(
                  key: Key('issueListText'),
                  '$header : $description',
                  style: TextStyle(color: Color(0xff025273), fontSize: FontSizes.caption - 1),
                ),
              ),
            ),
            Divider(height: 5),
          ],
        ),
      ),
    );
  }
}
