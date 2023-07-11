// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/feature/constants/other/time_functions.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';

import '../../constants/other/colors.dart';

class DetailListWidget extends StatelessWidget {
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
      timeInfoNow,
      ani,
      id,
      plannedDate,
      contactName,
      locName,
      locTree,
      locTree2,
      title,
      cmdb,
      hys,
      hds,
      assignmentGroup,
      assignmentGroupName,
      assigneName,
      relatedCode,
      cat1,
      contactCode,
      plannedDesc,
      slaCode,
      parentStatus,
      wrondDirect,
      respondedDate,
      respondedTimer,
      fixedDate,
      fixTimer,
      xusercode;

  final Color? importanceLevelColor;
  final VoidCallback? press;
  final bool isIcon;
  final Function onPressed;

  const DetailListWidget(
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
      this.ani,
      this.assigneName,
      this.assignmentGroup,
      this.assignmentGroupName,
      this.cat1,
      this.cmdb,
      this.contactCode,
      this.contactName,
      this.hds,
      this.hys,
      this.id,
      this.locName,
      this.locTree,
      this.locTree2,
      this.parentStatus,
      this.plannedDate,
      this.plannedDesc,
      this.relatedCode,
      this.slaCode,
      this.title,
      this.wrondDirect,
      this.fixTimer,
      this.fixedDate,
      this.respondedDate,
      this.respondedTimer,
      this.xusercode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height / 1.8,
          child: SingleChildScrollView(
            child: Padding(
              padding: CustomPaddings.onlyBottomLow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          statusCode == 'OPlanned'
                              ? Container(
                                  decoration: BoxDecoration(color: APPColors.NewNotifi.blue, borderRadius: BorderRadius.circular(3)),
                                  padding: EdgeInsets.all(3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Randevulu Vakadır'),
                                      Text(planedDate.toString()),
                                    ],
                                  ),
                                )
                              : respondedTimer == '1'
                                  ? timeBarWidget('Hedef Yanıtlama Tarihi', targetRDate, respondedTimer.toString(),
                                      fixTimer.toString(), targetFDate.toString(), fixedDate.toString())
                                  : timeBarWidget('Yanıtlama Tarihi', respondedDate, respondedTimer.toString(),
                                      fixTimer.toString(), targetFDate.toString(), fixedDate.toString())
                        ],
                      ),
                      Column(children: [
                        fixTimer == '1'
                            ? timeBarWidget('Hedef Düzeltme Tarihi', targetFDate, respondedTimer.toString(), fixTimer.toString(),
                                targetFDate.toString(), fixedDate.toString())
                            : timeBarWidget('Düzeltme Tarihi', fixedDate, respondedTimer.toString(), fixTimer.toString(),
                                targetFDate.toString(), fixedDate.toString())
                      ])
                    ],
                  ),
                  Divider(height: 15, color: APPColors.Main.black),
                  issueSummaryRow(code.toString(), description.toString()),
                  issueSummaryRow('Vaka Durumu', statusName.toString()),
                  issueSummaryRow('Açıklama', description.toString()),
                  issueSummaryRow('Vaka Sahibi', contactName.toString()),
                  issueSummaryRow('Mahal', locName.toString()),
                  issueSummaryRow('Mahal Yeri', locTree.toString()),
                  issueSummaryRow('Arama Nedeni', title.toString()),
                  issueSummaryRow('Varlık Bilgisi', cmdb.toString()),
                  issueSummaryRow('Açılma Tarihi', idate.toString()),
                  issueSummaryRow('Arayan Numara', ani.toString()),
                  issueSummaryRow('Hedef Yanıtlama', TimeClass().timeRecover(targetRDate).toString()),
                  issueSummaryRow('Hedef Düzeltme', TimeClass().timeRecover(targetFDate).toString()),
                  issueSummaryRow('HYS-48 saat', hys.toString()),
                  issueSummaryRow('HDS-48 saat', hds.toString()),
                  issueSummaryRow('Atama Grubu', assignmentGroupName.toString()),
                  issueSummaryRow('Atanan Kişi', assigneName.toString()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container timeBarWidget(String header, targetTime, respondedTime, fixTime, targetDate, fixedDate) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(header),
          NullCheckWidget().nullCheckWidget(
              targetTime,
              Text('Zaman Bilgisine Ulaşılamadı'),
              Text(
                TimeClass().timeRecover(targetTime),
                style: TimeClass().fixStyle(respondedTime, fixTime, targetDate, fixedDate),
              ))
        ],
      ),
    );
  }

  Column issueSummaryRow(header, description) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: TextStyle(
                  color: APPColors.Secondary.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: NullCheckWidget().nullCheckWidget(
                  description,
                  Text('Bilgi Yok'),
                  Text(
                    description,
                    style: TextStyle(color: APPColors.Secondary.black, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                )),
          ],
        ),
        Divider(
          height: 15,
        ),
      ],
    );
  }
}

