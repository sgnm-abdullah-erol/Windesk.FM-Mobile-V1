import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
            Text('WO ${workSpaceDetail.task?.id}', style: Theme.of(context).textTheme.bodyMedium),
            Text('${workSpaceDetail.state?.name}', style: Theme.of(context).textTheme.bodyMedium),
            const CustomWoSummaryDivider(),
            const SizedBox(height: 10),
            Text(workSpaceDetail.task?.description ?? '', style: Theme.of(context).textTheme.bodyMedium),
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
            Text(firstLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(firstValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(secondValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(thirdLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(thirdValue, style: Theme.of(context).textTheme.bodyMedium),
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
            Text(firstLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(firstValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(secondValue, style: Theme.of(context).textTheme.bodyMedium),
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
            Text(firstLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(firstValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 5),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButtonWithIcon(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.05,
                bgColor: APPColors.Main.blue,
                onPressFunction: workOrderDetailProvider.scanBarcodeAndQr,
                textValue: LocaleKeys.Change.tr(),
                textColor: APPColors.Main.black,
                iconColor: APPColors.Main.black,
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
              Text(LocaleKeys.ResponseDate.tr(), style: Theme.of(context).textTheme.bodySmall),
              Text(
                workSpaceDetail.workspace?.updatedAt?.toString().substring(0, 19) ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
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
              Text(LocaleKeys.UpdateDate.tr(), style: Theme.of(context).textTheme.bodySmall),
              Text(
                workSpaceDetail.task?.updatedAt.toString().substring(0, 19) ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
