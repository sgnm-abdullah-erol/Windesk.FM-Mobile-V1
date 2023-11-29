import 'package:flutter/material.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';

class CustomScopeListCard extends StatelessWidget {
  const CustomScopeListCard({super.key, required this.name, required this.controlList, this.startDate, this.technician, this.onTap});

  final String name;
  final String controlList;
  final String? startDate;
  final String? technician;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: Container(
            height: context.height / 4,
            decoration: BoxDecoration(
              color: APPColors.Main.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: APPColors.Main.grey, blurRadius: 2, offset: const Offset(0, 4))],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleAndLabel(context,LocaleKeys.name,name),
                  _titleAndLabel(context,LocaleKeys.controlList,controlList),
                  _titleAndLabel(context,LocaleKeys.startDate,''),
                  _titleAndLabel(context,LocaleKeys.technician,'')],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _titleAndLabel(BuildContext context, String title, String label) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              maxLines: 1,
              style: context.titleSmall.copyWith(color: APPColors.Main.black),
            ),
          ),
          SizedBox(),
          Expanded(
            flex:4,
            child: Text(
              label,
              maxLines: 1,
              style: context.labelMedium.copyWith(color: APPColors.Main.black),
            ),
          ),
        ],
      ),
    );
  }
}
