import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/components/input_fields/dropdown_input_fields.dart';
import '../../../../../../feature/components/modal_alert/wo_wait_accept_modal_alert.dart';
import '../../../../../../feature/components/snackBar/snackbar.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../../../../../../feature/constants/other/snackbar_strings.dart';
import '../../../../../../feature/constants/style/border_radius.dart';
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
        ChangeNotifierProvider(create: (context) => WorkOrderDetailServiceProvider()),
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
                            CustomWorkSpaceDetailCard(workSpaceDetail: woDetailProvider.detail),
                            const SizedBox(height: 10),
                            (woDetailProvider.detail.task?.userId ?? '') != context.read<GlobalProvider>().userId
                                ? _TakeItOnMe(provider: woDetailProvider)
                                : _StateChangeDropDownButton(provider: woDetailProvider),
                            const SizedBox(height: 20),
                            (woDetailProvider.detail.task?.userId ?? '') != context.read<GlobalProvider>().userId
                                ? const SizedBox()
                                : _customPageAccordionSection(woDetailProvider),
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

  Padding _customPageAccordionSection(WorkOrderDetailProvider woDetailProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomBaseAccordion(
        list: [
          _accordionSection(AppStrings.efforts, AddEffortsAccordion(provider: woDetailProvider), AppIcons.insightsRounded),
          _accordionSection(AppStrings.addMaterial, AddMaterialAccordion(provider: woDetailProvider), AppIcons.warehouse),
          _accordionSection(AppStrings.requstMaterial, RequestMaterialAccordion(provider: woDetailProvider), AppIcons.tool),
          _accordionSection(AppStrings.addDocumant, AddDocumantAccordion(provider: woDetailProvider), AppIcons.photoAlbum),
        ],
      ),
    );
  }

  AccordionSection _accordionSection(String title, Widget content, IconData icon) {
    return AccordionSection(
      isOpen: false,
      headerBackgroundColor: APPColors.Accent.black,
      headerBackgroundColorOpened: APPColors.Accent.black,
      leftIcon: Icon(icon, color: APPColors.Main.white),
      contentBorderColor: APPColors.Accent.black,
      onOpenSection: () {},
      header: Text(title, style: TextStyle(color: APPColors.Main.white, letterSpacing: 1.5)),
      content: content,
    );
  }
}

class _StateChangeDropDownButton extends StatelessWidget {
  const _StateChangeDropDownButton({required this.provider});

  final WorkOrderDetailProvider provider;
  final String _currentState = 'Anlık İş Durumu';
  final String _alertTextOne = 'İş emrinin anlık durumunu ';
  final String _alertTextTwo = ' durumuna almak istediğinizden emin misiniz?';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: DropDownInputFields(
        labelText: _currentState,
        onChangedFunction: (val) async {
          await WoWaitAcceptModalAlert()
              // ignore: prefer_interpolation_to_compose_strings
              .showAlertDialog(context, "${"$_alertTextOne'" + val}'$_alertTextTwo", AppStrings.changeState)
              .then((value) {
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
      onPressed: () {
        provider.takeItOnMe();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        AppStrings.takeItOnMe,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: APPColors.Main.white),
      ),
    );
  }
}
