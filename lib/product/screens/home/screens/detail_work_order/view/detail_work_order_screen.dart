import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../widgets/add_documant_accordion.dart';
import '../widgets/add_efforts_accordion.dart';
import '../widgets/request_material_accordion.dart';
import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../../../../../../feature/global_providers/global_provider.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../provider/work_order_detail_provider.dart';
import '../../work_order_list/widgets/custom_base_accordion.dart';

import '../../../../../../feature/components/cards/custom_wo_detail_summary.card.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../widgets/add_material_accordion.dart';

@RoutePage()
class DetailWorkOrderScreen extends StatefulWidget {
  const DetailWorkOrderScreen({super.key, required this.workSpaceDetail});

  final WorkSpaceDetail workSpaceDetail;

  @override
  State<DetailWorkOrderScreen> createState() => _DetailWorkOrderScreenState();
}

class _DetailWorkOrderScreenState extends State<DetailWorkOrderScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderDetailProvider(),
      child: Consumer<WorkOrderDetailProvider>(
        builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          return Scaffold(
            appBar: CustomMainAppbar(title: Text(widget.workSpaceDetail.task?.name ?? ''), returnBack: true, elevation: 4),
            body: context.read<WorkOrderDetailProvider>().isLoading
                ? const CustomLoadingIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        WoSummary(workSpaceDetail: widget.workSpaceDetail),
                        const SizedBox(height: 20),
                        (widget.workSpaceDetail.task?.user ?? '') == context.read<GlobalProvider>().userName
                            ? Container(color: Colors.red, height: 50)
                            : Container(color: Colors.green, height: 50),
                        //_startEndButton(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              CustomBaseAccordion(
                                list: [
                                  _accordionSection(AppStrings.efforts, const AddEffortsAccordion(), AppIcons.insightsRounded),
                                  _accordionSection(AppStrings.addMaterial, const AddMaterialAccordion(), AppIcons.warehouse),
                                  _accordionSection(AppStrings.requstMaterial, const RequestMaterialAccordion(), AppIcons.tool),
                                  _accordionSection(AppStrings.addDocumant, const AddDocumantAccordion(), AppIcons.photoAlbum),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  AccordionSection _accordionSection(String title, Widget content, IconData icon) {
    return AccordionSection(
      isOpen: false,
      headerBackgroundColor: APPColors.Login.blue,
      headerBackgroundColorOpened: Colors.black,
      leftIcon: Icon(icon, color: Colors.white),
      onOpenSection: () {},
      header: Text(title),
      content: content,
    );
  }

  // CustomHalfButtons _startEndButton() {
  //   return CustomHalfButtons(
  //     leftTitle: const Text(AppStrings.start),
  //     rightTitle: const Text(AppStrings.end),
  //     leftOnPressed: () {},
  //     rightOnPressed: () {},
  //   );
  // }
}

// StatelessWidget _woDetailSummary(BuildContext context) {
//   WorkOrderDetailsModel woDetail = context.read<WorkOrderDetailProvider>().woDetailList;
//   return WoSummary(woModel: woDetail);
// }
