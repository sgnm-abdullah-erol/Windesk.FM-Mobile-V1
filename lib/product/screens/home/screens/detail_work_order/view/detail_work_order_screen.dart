// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../core/constants/other/snackbar_strings.dart';
import '../../../../../../core/constants/style/border_radius.dart';
import '../../../../../../feature/components/alert_dialog/wo_wait_accept_modal_alert.dart';
import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/components/input_fields/dropdown_input_fields.dart';
import '../../../../../../feature/components/snackBar/snackbar.dart';
import '../../../../../../feature/global_providers/global_provider.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../work_order_list/widgets/custom_base_accordion.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/work_order_detail_provider.dart';
import '../provider/work_order_detail_service_provider.dart';
import '../widgets/add_documant_accordion.dart';
import '../widgets/add_efforts_accordion.dart';
import '../widgets/add_material_accordion.dart';
import '../widgets/custom_work_space_detail_card.dart';
import '../widgets/request_material_accordion.dart';

@RoutePage()
class DetailWorkOrderScreen extends StatelessWidget {
  const DetailWorkOrderScreen({super.key, required this.workSpaceDetail});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final WorkSpaceDetail workSpaceDetail;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkOrderDetailServiceProvider(detail: workSpaceDetail)),
        ChangeNotifierProvider(create: (context) => WorkOrderDetailProvider(detail: workSpaceDetail)),
      ],
      child: Consumer<WorkOrderDetailProvider>(
        builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            if (woDetailProvider.effortAdded) {
              snackBar(context, SnackbarStrings.effortAdded, 'success');
            }
            if (woDetailProvider.isTaskStateChange) {
              snackBar(context, '${SnackbarStrings.taskStateChange} Yeni görev ${woDetailProvider.selectedTaskState}', 'success');
              context.router.pop<bool>(true);
            }

            if (woDetailProvider.takeItOnMeSuccess) {
              snackBar(context, SnackbarStrings.takeItOnMeSuccess, 'success');
            }
          });

          return Scaffold(
            key: _scaffoldKey,
            appBar: CustomMainAppbar(title: Text('WO - ${woDetailProvider.detail.task?.id.toString() ?? ''}'), returnBack: true, elevation: 4),
            body: context.read<WorkOrderDetailProvider>().isLoading
                ? const CustomLoadingIndicator()
                : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1), () {
                        woDetailProvider.setStateToBeginning();
                      });
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          children: [
                            CustomWorkSpaceDetailCard(workSpaceDetail: woDetailProvider.detail, workOrderDetailProvider: woDetailProvider),
                            const SizedBox(height: 10),
                            (woDetailProvider.detail.task?.userId ?? '') != context.read<GlobalProvider>().userId
                                ? _TakeItOnMe(provider: woDetailProvider)
                                : _StateChangeDropDownButton(provider: woDetailProvider),
                            const SizedBox(height: 20),
                            (woDetailProvider.detail.task?.userId ?? '') != context.read<GlobalProvider>().userId
                                ? const SizedBox()
                                : _customPageAccordionSection(context, woDetailProvider),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Padding _customPageAccordionSection(BuildContext context, WorkOrderDetailProvider woDetailProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomBaseAccordion(
        list: [
          _accordionSection(context, LocaleKeys.Effort.tr(), AddEffortsAccordion(provider: woDetailProvider), AppIcons.insightsRounded),
          _accordionSection(context, LocaleKeys.Material.tr(), AddMaterialAccordion(provider: woDetailProvider), AppIcons.warehouse),
          _accordionSection(context, LocaleKeys.RequestMaterial.tr(), RequestMaterialAccordion(provider: woDetailProvider), AppIcons.tool),
          _accordionSection(context, LocaleKeys.Document.tr(), AddDocumantAccordion(provider: woDetailProvider), AppIcons.photoAlbum),
        ],
      ),
    );
  }

  AccordionSection _accordionSection(BuildContext context, String title, Widget content, IconData icon) {
    return AccordionSection(
      headerPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      isOpen: false,
      headerBackgroundColor: APPColors.Accent.black,
      headerBackgroundColorOpened: APPColors.Accent.black,
      contentBackgroundColor: context.theme ? APPColors.Accent.black : APPColors.Accent.white,
      leftIcon: Icon(icon, color: APPColors.Main.white),
      contentBorderColor: APPColors.Accent.black,
      onOpenSection: () {},
      header: Text(title, style: context.labelMedium.copyWith(color: APPColors.Main.white)),
      content: content,
    );
  }
}

class _StateChangeDropDownButton extends StatelessWidget {
  const _StateChangeDropDownButton({required this.provider});

  final WorkOrderDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: DropDownInputFields(
        labelText: LocaleKeys.ProccessEntry,
        onChangedFunction: (val) async {
          await WoWaitAcceptModalAlert()
              .showAlertDialog(
                  context,
                  "${"${LocaleKeys.ProccessEntryFirstALertDialog.tr()}'" + val}'${LocaleKeys.ProccessEntrySecondALertDialog.tr()}",
                  LocaleKeys.ChangeState.tr())
              .then((value) {
            // check response value
            if (value == true) {
              provider.changeState(val);
            } else {
              // fix this
            }
          });
        },
        rightIcon: AppIcons.arrowDown,
        dropDownArray: provider.workSpaceUserTaskLabels,
      ),
    );
  }
}

class _TakeItOnMe extends StatelessWidget {
  const _TakeItOnMe({required this.provider});

  final WorkOrderDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => provider.takeItOnMe(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(LocaleKeys.TakeItOnMe.tr(), style: context.bodySmall.copyWith(color: APPColors.Main.white)),
    );
  }
}
