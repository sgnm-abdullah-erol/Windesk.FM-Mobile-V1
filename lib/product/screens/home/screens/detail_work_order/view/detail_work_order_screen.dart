import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../../../../../../feature/global_providers/global_provider.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../work_order_list/widgets/custom_base_accordion.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/work_order_detail_provider.dart';
import '../widgets/add_documant_accordion.dart';
import '../widgets/add_efforts_accordion.dart';
import '../widgets/add_material_accordion.dart';
import '../widgets/custom_work_space_detail_card.dart';
import '../widgets/request_material_accordion.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkOrderDetailServiceProvider()),
        ChangeNotifierProvider(create: (context) => WorkOrderDetailProvider(detail: widget.workSpaceDetail)),
      ],
      child: Consumer<WorkOrderDetailProvider>(
        builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          return Scaffold(
            appBar: CustomMainAppbar(title: Text('WO - ${widget.workSpaceDetail.task?.id.toString() ?? ''}'), returnBack: true, elevation: 4),
            body: context.read<WorkOrderDetailProvider>().isLoading
                ? const CustomLoadingIndicator()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Column(
                        children: [
                          CustomWorkSpaceDetailCard(workSpaceDetail: widget.workSpaceDetail),
                          // WoSummary(workSpaceDetail: widget.workSpaceDetail),
                          (widget.workSpaceDetail.task?.user ?? '') == context.read<GlobalProvider>().userName
                              ? const SizedBox(height: 25)
                              : const SizedBox(height: 25),
                          //_startEndButton(),
                          const SizedBox(height: 20),
                          _customPageAccordionSection(woDetailProvider),
                        ],
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
