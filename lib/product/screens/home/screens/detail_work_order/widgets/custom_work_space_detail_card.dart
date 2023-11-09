import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/change_location_leaf_model_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/get_task_history_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../core/constants/style/border_radius.dart';
import '../../../../../../feature/components/buttons/custom_elevated_button_with_icon.dart';
import '../../../../../../feature/components/dividers/custom_wo_summary_divider.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../provider/work_order_detail_provider.dart';

class CustomWorkSpaceDetailCard extends StatelessWidget {
  const CustomWorkSpaceDetailCard({super.key, required this.workSpaceDetail, required this.workOrderDetailProvider});

  final WorkSpaceDetail workSpaceDetail;
  final WorkOrderDetailProvider workOrderDetailProvider;

  final double _elevation = 8;
  final EdgeInsets _paddingCardInside = const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: APPColors.Main.white,
      elevation: _elevation,
      shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
      child: Padding(
        padding: _paddingCardInside,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ResponseDates(workSpaceDetail: workSpaceDetail),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            Text('WO ${workSpaceDetail.task?.id}', style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            // Text('${workSpaceDetail.state?.name}', style: context.labelMedium.copyWith(color: APPColors.Main.black)),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            Text(workSpaceDetail.task?.description ?? '', style: context.labelMedium.copyWith(color: APPColors.Main.black)),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            _DoubleRowInformation(
              firstLabel: LocaleKeys.Claiment.tr(),
              secondLabel: LocaleKeys.Category.tr(),
              firstValue: workSpaceDetail.workspace?.owner ?? '',
              secondValue: workSpaceDetail.task?.requestType?.name ?? '',
            ),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            _FourRowInformation(
              firstLabel: LocaleKeys.OpenDate.tr(),
              secondLabel: LocaleKeys.UpdateDate.tr(),
              thirdLabel: LocaleKeys.LastUpdateDate.tr(),
              firstValue: workSpaceDetail.workspace?.createdAt.toString().substring(0, 19) ?? '',
              secondValue: workSpaceDetail.workspace?.updatedAt.toString().substring(0, 19) ?? '',
              thirdValue: workSpaceDetail.task?.updatedAt.toString().substring(0, 19) ?? '',
            ),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            _DoubleRowInformation(
              firstLabel: LocaleKeys.AssignedGroup.tr(),
              secondLabel: LocaleKeys.AssignedPerson.tr(),
              firstValue: workSpaceDetail.task?.woCategory?.name ?? '',
              secondValue: workSpaceDetail.task?.user ?? '',
            ),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),

            // location
            _LocationInformation(
              workSpaceDetail,
              workOrderDetailProvider,
            ),
            const CustomWoSummaryDivider(),

            _TaskHistory(workSpaceDetail, workOrderDetailProvider),

            const SizedBox(height: 10),
            const SizedBox(height: 10),
            _DoubleRowInformationComponent(
              firstLabel: LocaleKeys.Presence.tr(),
              secondLabel: LocaleKeys.AssignedPerson.tr(),
              firstValue: workSpaceDetail.task?.requestedComponents?.name ?? '',
              secondValue: workSpaceDetail.task?.user ?? '',
              workOrderDetailProvider: workOrderDetailProvider,
            ),
            const CustomWoSummaryDivider(),
          ],
        ),
      ),
    );
  }
}

class _LocationInformation extends StatelessWidget {
  const _LocationInformation(this.workSpaceDetail, this.workOrderDetailProvider);

  final WorkSpaceDetail workSpaceDetail;
  final WorkOrderDetailProvider workOrderDetailProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: Text(LocaleKeys.Location.tr(), style: context.bodySmall.copyWith(color: APPColors.Main.black))),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    final result = await ShowModalBottomSheet().show(
                      context,
                      ChangeLocationLeafModelBottomSheet(
                        rootTitle: workSpaceDetail.task?.requestedSpaces?.name ?? '',
                        taskId: workSpaceDetail.task?.id.toString() ?? '',
                        templatedBy: workSpaceDetail.task?.templatedBy ?? '',
                        dependedOn: workSpaceDetail.task?.depended_on.toString() ?? '',
                      ),
                    );
                    if (result != '') {
                      workSpaceDetail.task?.requestedSpaces?.name = result ?? '';
                      //context.router.popAndPush(DetailWorkOrderScreen(workSpaceDetail: workSpaceDetail));
                    }
                  },
                  icon: const Icon(AppIcons.change),
                ),
                Text(
                  workSpaceDetail.task?.requestedSpaces?.name ?? '',
                  style: context.labelMedium.copyWith(color: APPColors.Main.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TaskHistory extends StatelessWidget {
  const _TaskHistory(this.workSpaceDetail, this.workOrderDetailProvider);

  final WorkSpaceDetail workSpaceDetail;
  final WorkOrderDetailProvider workOrderDetailProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: Text('Tarihçe', style: context.bodySmall.copyWith(color: APPColors.Main.black))),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomElevatedButtonWithIcon(
                  width: context.width / 3,
                  height: context.height * 0.03,
                  bgColor: APPColors.Accent.black,
                  onPressFunction: () async {
                    await workOrderDetailProvider.getTaskHistory(workSpaceDetail.task?.id);

                    // ignore: use_build_context_synchronously
                    GetTaskHistoryModalBottomSheet().showAlertDialog(context, workOrderDetailProvider, 'textData', 'Tarihçe');
                  },
                  textValue: 'İncele',
                  textColor: APPColors.Main.white,
                  iconColor: APPColors.Main.white,
                  icon: Icons.qr_code,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FourRowInformation extends StatelessWidget {
  const _FourRowInformation({
    required this.firstLabel,
    required this.secondLabel,
    required this.thirdLabel,
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
  });

  final String firstLabel;
  final String secondLabel;
  final String thirdLabel;
  final String firstValue;
  final String secondValue;
  final String thirdValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(firstValue, style: context.labelMedium.copyWith(color: APPColors.Main.black)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(secondValue, style: context.labelMedium.copyWith(color: APPColors.Main.black)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(thirdLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(thirdValue, style: context.labelMedium.copyWith(color: APPColors.Main.black)),
          ],
        ),
      ],
    );
  }
}

class _DoubleRowInformation extends StatelessWidget {
  const _DoubleRowInformation({required this.firstLabel, required this.secondLabel, required this.firstValue, required this.secondValue});

  final String firstLabel;
  final String secondLabel;

  final String firstValue;
  final String secondValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(firstValue, style: context.labelMedium.copyWith(color: APPColors.Main.black)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(secondValue, style: context.labelMedium.copyWith(color: APPColors.Main.black)),
          ],
        ),
      ],
    );
  }
}

class _DoubleRowInformationComponent extends StatelessWidget {
  const _DoubleRowInformationComponent(
      {required this.firstLabel,
      required this.secondLabel,
      required this.firstValue,
      required this.secondValue,
      required this.workOrderDetailProvider});

  final String firstLabel;
  final String secondLabel;

  final WorkOrderDetailProvider workOrderDetailProvider;

  final String firstValue;
  final String secondValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstLabel, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
            Text(
              firstValue,
              style: context.labelMedium.copyWith(color: APPColors.Main.black),
            )
          ],
        ),
        const SizedBox(height: 5),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButtonWithIcon(
                width: context.width / 3,
                height: context.height * 0.05,
                bgColor: APPColors.Accent.black,
                onPressFunction: workOrderDetailProvider.scanBarcodeAndQr,
                textValue: LocaleKeys.Change.tr(),
                textColor: APPColors.Main.white,
                iconColor: APPColors.Main.white,
                icon: Icons.qr_code,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ResponseDates extends StatelessWidget {
  const _ResponseDates({required this.workSpaceDetail});
  final WorkSpaceDetail workSpaceDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(LocaleKeys.ResponseDate.tr(), style: context.bodySmall.copyWith(color: APPColors.Main.black)),
              Text(
                workSpaceDetail.workspace?.updatedAt?.toString().substring(0, 19) ?? '',
                style: context.labelMedium.copyWith(color: APPColors.Main.black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(LocaleKeys.UpdateDate.tr(), style: context.bodySmall.copyWith(color: APPColors.Main.black)),
              Text(
                workSpaceDetail.task?.updatedAt.toString().substring(0, 19) ?? '',
                style: context.labelMedium.copyWith(color: APPColors.Main.black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
