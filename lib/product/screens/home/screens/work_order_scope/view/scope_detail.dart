import 'package:accordion/accordion_section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_base_accordion.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/add_check_item_accordion.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/add_documant_accordion.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_check_item_card.dart';

@RoutePage()
class ScopeDetail extends StatelessWidget {
  const ScopeDetail({super.key, this.maintanenceList, this.checkListValueModel});
  final MaintanenceModel? maintanenceList;
  final StartCheckListValueModel? checkListValueModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScopeProvider(),
      child: Scaffold(
        appBar: CustomMainAppbar(
          title: Text('${LocaleKeys.CheckList.tr()} - ${maintanenceList?.id.toString()}'),
          returnBack: true,
        ),
        body: Consumer<ScopeProvider>(
          builder: (context, ScopeProvider provider, child) {
            return SizedBox(
              child: ListView.builder(
                itemCount: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?.length,
                itemBuilder: (context, index) {
                  return CustomScopeCheckItemCard(
                    checkItem: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?[index],
                    provider: provider,
                    checkListValueId: checkListValueModel?.id,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

Padding _customPageAccordionSection(BuildContext context, ScopeProvider provider, StartCheckListValueModel? checkListValueModel,MaintanenceModel? maintanenceList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: CustomBaseAccordion(list: _filterAcordionList(context, provider, checkListValueModel!, maintanenceList)),
  );
}

List<AccordionSection> _filterAcordionList(BuildContext context, ScopeProvider provider, StartCheckListValueModel checkListValueModel,MaintanenceModel? maintanenceList) {
  return [
    //_accordionSection(context, LocaleKeys.Effort.tr(), AddEffortsAccordion(provider: provider), AppIcons.insightsRounded),
    //_accordionSection(context, LocaleKeys.RequestMaterial.tr(), RequestMaterialAccordion(provider: provider), AppIcons.tool),
    //_accordionSection(context, LocaleKeys.Active.tr(), AddCheckItemAcordion(maintanenceList: maintanenceList ,checkListValueModel: checkListValueModel, provider: provider, taskId: checkListValueModel.id.toString(), taskKey: checkListValueModel.key.toString(),), AppIcons.photoAlbum),
    _accordionSection(context, LocaleKeys.Document.tr(), AddDocumantAccordion(provider: provider, taskId: checkListValueModel.id.toString(), taskKey: checkListValueModel.key.toString(),), AppIcons.photoAlbum),
  ];
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
