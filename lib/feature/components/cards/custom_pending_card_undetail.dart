import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart';
import '../../../product/screens/home/screens/work_order_list/provider/work_order_pendiks_provider.dart';
import '../../../core/constants/other/colors.dart';
import '../../../core/constants/other/snackbar_strings.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/box_decorations.dart';
import '../../../core/constants/style/custom_paddings.dart';
import '../../../core/constants/style/font_sizes.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/date_string_extension.dart';
import '../../models/work_space/work_space_appendings.dart';
import '../buttons/custom_half_buttons.dart';
import '../alert_dialog/wo_wait_accept_modal_alert.dart';
import '../alert_dialog/wo_wait_reject_modal_alert.dart';
import '../snackBar/snackbar.dart';

class CustomPendingCardUndetail extends StatelessWidget {
  const CustomPendingCardUndetail({super.key, required this.pendiks, required this.onTap, required this.provider});

  final WorkOrderListProvider provider;
  final WorkSpacePendiks pendiks;
  final Function onTap;

  final double _elevation = 4;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: CustomPaddings.pageNormal,
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderPendiksProvider(),
          child: Consumer<WorkOrderPendiksProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  if (value.isTaskStateChange) {
                    snackBar(context, '${SnackbarStrings.taskStateChange} Yeni görev ${value.selectedTaskState}', 'success');
                  }
                },
              );
              return Card(
                shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
                elevation: _elevation,
                child: Container(
                  width: context.width / 1.2,
                  decoration: WoListCardDecoration(),
                  child: _Content(pendiks, value),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content(this.pendiks, this.provider);
  final WorkSpacePendiks pendiks;
  final WorkOrderPendiksProvider provider;

  final String _labelStartDate = 'Açılma Tarihi:';
  final String _labelUpdatedDate = 'Güncellenme Tarihi:';
  final String _labelEndDate = 'Bitiş Tarihi:';
  final String _nextStatesLabel = 'Sonraki Durumlar:';
  final String _approveWorkOrder = 'İş Emrini Onayla';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _codeAndStatusWidget(context),
          _divider(),
          _desc(context),
          _divider(),
          _woLocationText(context),
          _divider(),
          const SizedBox(height: 5),
          _dateText(context, _labelStartDate, pendiks.calendar?.start.toString() ?? '', true),
          const SizedBox(height: 5),
          _dateText(context, _labelUpdatedDate, pendiks.task?.updatedAt.toString() ?? '', false),
          const SizedBox(height: 5),
          _dateText(context, _labelEndDate, pendiks.calendar?.end.toString() ?? '', true),
          const SizedBox(height: 20),
          _ActionButtons(pendiks: pendiks, nextStatesLabel: _nextStatesLabel, approveWorkOrder: _approveWorkOrder, provider: provider)
        ],
      ),
    );
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
                'WO ${pendiks.task?.id.toString() ?? LocaleKeys.NoCode}',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: APPColors.Secondary.black, fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.bold),
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                pendiks.state?.name.toString() ?? LocaleKeys.NoState,
                style: TextStyle(fontWeight: FontWeight.bold, color: APPColors.Secondary.black, fontSize: FontSizes.caption),
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateText(BuildContext context, String label, String date, bool giveFormat) {
    var textStyle = Theme.of(context).textTheme.bodyMedium;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        Text(
          giveFormat ? date.splitString(date) : date.splitStringSecond(date),
          style: textStyle,
        )
      ],
    );
  }

  Widget _desc(BuildContext context) {
    return Text(pendiks.task?.description ?? '', style: Theme.of(context).textTheme.bodyMedium);
  }

  Column _woLocationText(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pendiks.workspace?.owner ?? '',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        Text(
          pendiks.workspace?.name ?? '',
          style: textStyle,
        ),
      ],
    );
  }

  Divider _divider() => Divider(height: 10, thickness: 0.5, color: APPColors.Secondary.black);
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({
    required this.pendiks,
    required String nextStatesLabel,
    required String approveWorkOrder,
    required this.provider,
  })  : _nextStatesLabel = nextStatesLabel,
        _approveWorkOrder = approveWorkOrder;

  final WorkSpacePendiks pendiks;
  final WorkOrderPendiksProvider provider;
  final String _nextStatesLabel;
  final String _approveWorkOrder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomHalfButtons(
        leftTitle: const Text(LocaleKeys.Cancel).tr(),
        rightTitle: const Text(LocaleKeys.Approve).tr(),
        leftOnPressed: () => _rejectButton(context),
        rightOnPressed: () => _approveButton(context),
      ),
    );
  }

  void _approveButton(BuildContext context) {
    final String nextStateName = pendiks.state?.nextStates?[0].name ?? '';
    final String nextStateDesc = 'İş emrinin anlık durumunu $nextStateName durumuna almak istediğinizden emin misiniz?';
    WoWaitAcceptModalAlert().showAlertDialog(context, nextStateDesc, _approveWorkOrder).then((value) {
      if (value != null) {
        if (value == true) {
          // provider.changeState(nextStateName);
        }
      }
    });
  }

  void _rejectButton(BuildContext context) async {
    List<String> pendikNextStateLabels = [];
    for (var i = 0; i < (pendiks.state?.nextStates?.length ?? 0); i++) {
      pendikNextStateLabels.add(pendiks.state?.nextStates?[i].name ?? '');
    }
    WoWaitRejectModalAlert()
        .showAlertDialog(context, 'textData', _nextStatesLabel, pendikNextStateLabels, provider.onChangedSelectedTask)
        .then((value) {
      if (value != null) {
        if (value == true) {
          for (var i = 0; i < (pendiks.state?.nextStates?.length ?? 0); i++) {
            if (pendiks.state?.nextStates?[i].name == provider.selectedTaskState) {
              provider.changeState(pendiks.task?.id.toString() ?? '', pendiks.state?.nextStates?[i].id.toString() ?? '');
            }
          }
        }
      }
    });
  }
}
