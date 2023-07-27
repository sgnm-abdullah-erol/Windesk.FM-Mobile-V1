// ignore_for_file: avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/cards/custom_undetail_pending_card.dart';
import 'package:vm_fm_4/feature/components/modal_alert/wo_wait_reject_modal_alert.dart';
import 'package:vm_fm_4/feature/constants/other/app_strings.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/product/screens/home/screens/pending_detail_work_order/pending_detail_work_order_provider.dart';

import '../../../../../feature/components/modal_alert/wo_wait_accept_modal_alert.dart';
import '../../../../../feature/models/work_space/work_space_appendings.dart';

@RoutePage()
class PendingDetailWorkOrderScreen extends StatelessWidget {
  const PendingDetailWorkOrderScreen({super.key, required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PendingDetailWorkOrderProvider(),
      child: Consumer<PendingDetailWorkOrderProvider>(
        builder: (context, PendingDetailWorkOrderProvider provider, Widget? child) {
          return _BuildScaffold(workSpacePendiks: workSpacePendiks);
        },
      ),
    );
  }
}

class _BuildScaffold extends StatelessWidget {
  const _BuildScaffold({required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(title: Text(workSpacePendiks.task?.name ?? ''), elevation: 4, returnBack: true),
      body: Padding(
        padding: CustomPaddings.pageNormal,
        child: Column(
          children: [
            CustomUndetailPendingCard(workSpacePendiks: workSpacePendiks),
            const SizedBox(height: 20),
            CustomHalfButtons(
              leftTitle: const Text(AppStrings.reject),
              rightTitle: const Text(AppStrings.approve),
              leftOnPressed: () {
                WoWaitRejectModalAlert().showAlertDialog(context, 'textData', 'inputArrayLabelText', ['as', 'asd', 'sad'], () {}).then((value) {
                  if (value != null) {
                    value ? print(value) : print(value);
                  }
                });
              },
              rightOnPressed: () {
                WoWaitAcceptModalAlert().showAlertDialog(context, '', 'kk').then((value) {
                  if (value != null) {
                    value ? print(value) : print(value);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
