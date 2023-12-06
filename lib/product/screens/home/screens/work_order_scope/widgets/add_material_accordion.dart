// import 'package:accordion/accordion.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:provider/provider.dart';
// import 'package:vm_fm_4/feature/extensions/context_extension.dart';
// import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_service_provider.dart';
// import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

// import '../../../../../../../core/constants/other/app_icons.dart';
// import '../../../../../../../core/constants/other/colors.dart';
// import '../../../../../../../feature/components/model_bottom_sheet/add_material_modal_bottom_sheet.dart';
// import '../../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
// import '../../../../../../../generated/locale_keys.g.dart';

// class AddMaterialAccordion extends StatelessWidget {
//   const AddMaterialAccordion({super.key, required this.provider});

//   final ScopeProvider provider;

//   @override
//   Widget build(BuildContext context) {
//     return Accordion(
//       maxOpenSections: 1,
//       headerBackgroundColorOpened: APPColors.Accent.black,
//       children: [
//         AccordionSection(
//           headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//           isOpen: false,
//           contentBorderWidth: 0,
//           contentHorizontalPadding: 0,
//           contentVerticalPadding: 0,
//           headerBackgroundColor: APPColors.Accent.black,
//           leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
//           header: Text(LocaleKeys.AddMaterial, style: context.labelMedium.copyWith(color: APPColors.Main.white)).tr(),
//           rightIcon: const Icon(AppIcons.arrowDown, size: 0),
//           onOpenSection: () async {
//             ShowModalBottomSheet().show(
//               context,
//               AddMaterialModalBottomSheet(taskId: provider.detail.task?.id.toString() ?? '0', function: () {}),
//             );
//           },
//           content: const SizedBox(height: 0),
//         ),
//         AccordionSection(
//           headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//           isOpen: false,
//           headerBackgroundColor: APPColors.Accent.black,
//           leftIcon: Icon(AppIcons.warehouse, color: APPColors.Main.white),
//           header: Text(LocaleKeys.AddedMaterials.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
//           onOpenSection: () {
//             Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
//             provider.userClickedMaterialFunction();
//           },
//           content: Consumer<WorkOrderDetailServiceProvider>(
//             builder: ((context, value, child) {
//               SchedulerBinding.instance.addPostFrameCallback((_) {
//                 provider.userClickedMaterial
//                     ? value.isMaterialPartsFetched
//                         ? null
//                         : value.fetchSpareparts(provider.detail.task?.id.toString() ?? '')
//                     : null;
//               });

//               return value.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : DataTableAccordionSpareparts(
//                       provider: value,
//                       data: value.woSpareparts ?? [],
//                     );
//             }),
//           ),
//         )
//       ],
//     );
//   }
// }
