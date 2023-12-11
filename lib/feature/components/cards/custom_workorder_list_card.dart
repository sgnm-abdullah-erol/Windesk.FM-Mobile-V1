// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/style/border_radius.dart';
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
          _woListText(context, workSpaceDetail.task?.name ?? LocaleKeys.NoName, false),
          _divider(),
          SizedBox(height: 5),
          _woCategoryText(context),
          _divider(),
          SizedBox(height: 5),
          _woLocationText(context),
          _divider(),
          SizedBox(height: 5),
          _woOwnerText(context),
          _divider(),
          SizedBox(height: 5),
          _woListText(context, workSpaceDetail.task?.description ?? LocaleKeys.NoDescription, true),
          _divider(),
          SizedBox(height: 5),
          _dateText(context, LocaleKeys.HintStartDate, workSpaceDetail.calendar?.start.toString() ?? '', true),
          // SizedBox(height: 5),
          // _dateText(context, LocaleKeys.HintUpdateDate, workSpaceDetail.task?.updatedAt.toString() ?? '', true),
          SizedBox(height: 5),
          _dateText(context, LocaleKeys.HintEndDate, workSpaceDetail.calendar?.end.toString() ?? '', true),
          SizedBox(height: 5),
          _checkButtonVisibility(context)
        ],
      ),
    );
  }

  Divider _divider() => Divider(height: 10, thickness: 0.5, color: APPColors.Secondary.black);

  Widget _dateText(BuildContext context, String label, String date, bool giveFormat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.bodySmall.copyWith(fontWeight: FontWeight.bold, color: APPColors.Main.black)).tr(),
        Text(giveFormat ? date.splitString(date) : date.splitStringSecond(date), style: context.labelMedium.copyWith(color: APPColors.Main.black)),
      ],
    );
  }

  Row _woLocationText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Location.tr(),
          style: context.bodySmall.copyWith(fontWeight: FontWeight.bold, color: APPColors.Secondary.black),
        ),
        Spacer(),
        SizedBox(
          width: context.width / 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              workSpaceDetail.task?.requestedSpaces?.name ?? '',
              style: context.labelMedium.copyWith(color: APPColors.Main.black),
            ),
          ),
        ),
      ],
    );
  }

  Column _woCategoryText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workSpaceDetail.task?.woCategory?.name ?? '',
          style: context.bodySmall.copyWith(fontWeight: FontWeight.bold, color: APPColors.Secondary.black),
        ),
        // SizedBox(height: 5),
        // Text(workSpaceDetail.task?.requestType?.name ?? '', style: context.labelMedium.copyWith(color: APPColors.Main.black)),
      ],
    );
  }

  Row _woOwnerText(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.Owner.tr(),
          style: context.bodySmall.copyWith(fontWeight: FontWeight.bold, color: APPColors.Secondary.black),
        ),
        Spacer(),
        Text(
          workSpaceDetail.task?.owner ?? '',
          style: context.bodySmall.copyWith(fontWeight: FontWeight.bold, color: APPColors.Secondary.black),
        ),
      ],
    );
  }

  Widget _checkButtonVisibility(BuildContext context) {
    return isButtonVisible
        ? Center(
            child: CustomHalfButtons(
              leftTitle: Text(LocaleKeys.Cancel, style: context.bodySmall.copyWith(color: APPColors.Main.white)).tr(),
              leftOnPressed: () {},
              rightTitle: Text(LocaleKeys.Approve, style: context.bodySmall.copyWith(color: APPColors.Main.white)).tr(),
              rightOnPressed: () {},
            ),
          )
        : Container();
  }

  Flexible _codeAndStatusWidget(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: context.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'WO ${workSpaceDetail.task?.id.toString() ?? LocaleKeys.NoCode.tr()}',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.bold, fontFamily: "Poppins", color: APPColors.Main.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                workSpaceDetail.state?.name.toString() ?? LocaleKeys.NoState.tr(),
                style: context.labelMedium.copyWith(color: APPColors.Secondary.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _woListText(BuildContext context, String header, bool isBold) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(header.tr(),
                  style: context.labelMedium.copyWith(
                    color: APPColors.Secondary.black,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
