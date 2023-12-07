import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/add_efforts_modal_bottom_sheer_scope.dart';
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
            floatingActionButton: Consumer<ScopeProvider>(builder: (context, ScopeProvider provider, child) {
              return SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: const IconThemeData(size: 22.0),
                // this is ignored if animatedIcon is non null
                // child: Icon(Icons.add),
                visible: true,
                curve: Curves.bounceIn,
                overlayColor: Colors.black,
                overlayOpacity: 0.5,
                onOpen: () => print('OPENING DIAL'),
                onClose: () => {},
                tooltip: 'Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                elevation: 8.0,
                shape: const CircleBorder(),
                children: [
                  _speedDialChild(context, AppIcons.addPhoto, LocaleKeys.AddPhoto.tr(), APPColors.Main.grey, () {
                    ShowModalBottomSheet().show(
                      context,
                      AddImageModalBottomSheet(
                      taskId: checkListValueModel?.id.toString() ?? '',
                      taskKey: checkListValueModel?.key ?? '',
                      saveImage: provider.saveImage,
                    ),
                    );
                  }),
                  _speedDialChild(context, AppIcons.documantScanner, LocaleKeys.AddPdf.tr(), APPColors.Secondary.grey, () {}),
                  _speedDialChild(context, AppIcons.workHistory, LocaleKeys.AddEfforts.tr(), APPColors.Main.blue, () {
                    ShowModalBottomSheet().show(
                      context,
                      AddEffortsModalBottomSheet(
                        checkListValueId: checkListValueModel?.id ?? 0,
                        selectedStartDate: provider.setStartEffortDate,
                        selectedEndtDate: provider.setEndEffortDate,
                        selectedEffortDuration: provider.setEffortDuration,
                        selectedEffortType: provider.setEffortType,
                        selectedDescription: provider.setEffortDescription,
                        provider: provider,
                      ),
                    );
                  }),
                  _speedDialChild(context, AppIcons.save, LocaleKeys.Save.tr(), APPColors.Main.green, () {}),
                ],
              );
            })));
  }

  SpeedDialChild _speedDialChild(BuildContext context, IconData iconname, String label, Color color, Function onPressFunction) {
    return SpeedDialChild(
        child: Icon(iconname),
        backgroundColor: color,
        label: label,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        onTap: () {
          onPressFunction();
        });
  }
}
