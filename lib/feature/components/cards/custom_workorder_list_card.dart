// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/style/border_radius.dart';
import 'package:vm_fm_4/core/constants/style/font_sizes.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/extensions/date_string_extension.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/box_decorations.dart';
import '../buttons/custom_half_buttons.dart';

class CustomWorkOrderListCard extends StatelessWidget {
  final WorkSpaceDetail workSpaceDetail;
  final bool isButtonVisible;
  final Function onTap;

  const CustomWorkOrderListCard({
    Key? key,
    required this.workSpaceDetail,
    required this.isButtonVisible,
    required this.onTap,
  }) : super(key: key);

  final double _elevation = 4;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          elevation: _elevation,
          child: Container(width: context.width / 1.2, decoration: WoListCardDecoration(), child: _content(context)),
        ),
      ),
    );
  }

  Padding _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _codeAndStatusWidget(context),
          SizedBox(height: 5),
          _woListText(workSpaceDetail.task?.name ?? LocaleKeys.NoName),
          _divider(),
          SizedBox(height: 5),
          _woLocationText(),
          _divider(),
          SizedBox(height: 5),
          _woListText(workSpaceDetail.task?.description ?? LocaleKeys.NoDescription),
          _divider(),
          SizedBox(height: 5),
          _dateText(LocaleKeys.HintStartDate, workSpaceDetail.calendar?.start.toString() ?? '', true),
          // SizedBox(height: 5),
          // _dateText(_labelUpdatedDate, workSpaceDetail.task?.updatedAt.toString() ?? '', false),
          SizedBox(height: 5),
          _dateText(LocaleKeys.HintEndDate, workSpaceDetail.calendar?.end.toString() ?? '', true),
          SizedBox(height: 5),
          _checkButtonVisibility()
        ],
      ),
    );
  }

  Divider _divider() => Divider(height: 10, thickness: 0.5, color: APPColors.Secondary.black);

  Widget _dateText(String label, String date, bool giveFormat) {
    var textStyle = TextStyle(
      color: APPColors.Secondary.black,
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.caption + 1,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyle).tr(),
        Text(giveFormat ? date.splitString(date) : date.splitStringSecond(date), style: textStyle),
      ],
    );
  }

  Column _woLocationText() {
    var textStyle = TextStyle(color: APPColors.Secondary.black, fontWeight: FontWeight.w500, fontSize: FontSizes.caption + 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(workSpaceDetail.task?.woCategory?.name ?? '', style: textStyle),
        SizedBox(height: 5),
        Text(workSpaceDetail.task?.requestType?.name ?? '', style: textStyle),
      ],
    );
  }

  Widget _checkButtonVisibility() {
    return isButtonVisible
        ? Center(
            child: CustomHalfButtons(
              leftTitle: Text(LocaleKeys.Cancel, style: TextStyle(color: APPColors.Main.white)).tr(),
              leftOnPressed: () {},
              rightTitle: Text(LocaleKeys.Approve, style: TextStyle(color: APPColors.Main.white)).tr(),
              rightOnPressed: () {},
            ),
          )
        : Container();
  }

  Flexible _codeAndStatusWidget(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: context.width / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'WO ${workSpaceDetail.task?.id.toString() ?? LocaleKeys.NoCode}',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: APPColors.Secondary.black, fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.bold),
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                workSpaceDetail.state?.name.toString() ?? LocaleKeys.NoState,
                style: TextStyle(fontWeight: FontWeight.bold, color: APPColors.Secondary.black, fontSize: FontSizes.caption),
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }

  Column _woListText(header) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: TextStyle(color: APPColors.Secondary.black, fontWeight: FontWeight.w500, fontSize: FontSizes.caption + 1),
              ).tr(),
            ),
          ],
        ),
      ],
    );
  }
}