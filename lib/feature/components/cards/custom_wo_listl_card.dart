// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/feature/constants/style/border_radius.dart';
import 'package:vm_fm_4/feature/constants/style/font_sizes.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/extensions/date_string_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart';

import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/box_decorations.dart';
import '../../l10n/locale_keys.g.dart';
import '../../models/work_space/work_space_detail.dart';
import '../../route/app_route.gr.dart';
import '../buttons/custom_half_buttons.dart';

class CustomWoDetailCard extends StatelessWidget {
  final WorkSpaceDetail workSpaceDetail;
  final WorkOrderListProvider provider;
  final bool isButtonVisible;

  const CustomWoDetailCard({
    Key? key,
    required this.workSpaceDetail,
    required this.isButtonVisible,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(DetailWorkOrderScreen(workSpaceDetail: workSpaceDetail)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: CustomBorderRadius.mediumBorderRadius,
            side: BorderSide(color: APPColors.Secondary.black, width: 0.2),
          ),
          elevation: 8.0,
          child: Container(
            width: context.width / 1.2,
            decoration: WoListCardDecoration(),
            child: _content(context),
          ),
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
          codeAndStatusWidget(context),
          Divider(height: 10, thickness: 0.5, color: APPColors.Secondary.black),
          woListText(workSpaceDetail.task?.description ?? LocaleKeys.noDescription),
          woListText(DateExtension().splitString(workSpaceDetail.calendar?.start.toString() ?? '') ?? LocaleKeys.noDate),
          woListText(DateExtension().splitString(workSpaceDetail.calendar?.end.toString() ?? '') ?? LocaleKeys.noDate),
          _checkButtonVisibility()
        ],
      ),
    );
  }

  Widget _checkButtonVisibility() {
    return isButtonVisible
        ? Center(
            child: CustomHalfButtons(
              leftTitle: Text(AppStrings.cancel, style: TextStyle(color: APPColors.Main.white)),
              leftOnPressed: () {},
              rightTitle: Text(AppStrings.approve, style: TextStyle(color: APPColors.Main.white)),
              rightOnPressed: () {},
            ),
          )
        : Container();
  }

  Flexible codeAndStatusWidget(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: context.width / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'WO${workSpaceDetail.task?.id.toString() ?? LocaleKeys.noCode} ' ' ${workSpaceDetail.task?.name ?? LocaleKeys.noName} ',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: APPColors.Secondary.black, fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                workSpaceDetail.state?.name.toString() ?? LocaleKeys.noState,
                style: TextStyle(fontWeight: FontWeight.bold, color: APPColors.Secondary.black, fontSize: FontSizes.caption),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column woListText(header) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(header, style: TextStyle(color: APPColors.Secondary.black, fontWeight: FontWeight.w500, fontSize: FontSizes.caption)),
            ),
          ],
        ),
        Divider(height: 10, thickness: 0.5, color: APPColors.Secondary.black),
      ],
    );
  }
}
