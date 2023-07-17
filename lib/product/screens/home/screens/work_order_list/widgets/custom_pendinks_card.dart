import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';
import 'package:vm_fm_4/feature/constants/style/font_sizes.dart';

import '../../../../../../feature/components/dividers/custom_wo_summary_divider.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/models/work_space/work_space_appendings.dart';

class CustomPendiksCard extends StatelessWidget {
  const CustomPendiksCard({super.key, required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wo - ${workSpacePendiks.task?.id ?? ''} -${workSpacePendiks.task?.name ?? ''}', style: _textStyle()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.task?.description ?? '', style: _textStyle()),
              const CustomWoSummaryDivider(),
              Text(workSpacePendiks.task?.createdAt.toString() ?? '', style: _textStyle()),
              const CustomWoSummaryDivider(),
              const SizedBox(height: 10),
              CustomHalfButtons(
                leftTitle: const Text(AppStrings.reject),
                rightTitle: const Text(AppStrings.approve),
                leftOnPressed: () {},
                rightOnPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: APPColors.Main.black,
      fontSize: FontSizes.button,
      fontWeight: FontWeight.w600,
    );
  }
}
