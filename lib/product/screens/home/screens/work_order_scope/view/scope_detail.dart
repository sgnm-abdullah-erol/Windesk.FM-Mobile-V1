import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_document_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/graphql_result_handling.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/add_efforts_modal_bottom_sheer_scope.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_check_item_card.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/save_check_list_items_bottom_sheet.dart';

@RoutePage()
class ScopeDetail extends StatelessWidget {
  const ScopeDetail({super.key, this.maintanenceList, this.checkListValueModel, this.checkListSituation});
  final MaintanenceModel? maintanenceList;
  final StartCheckListValueModel? checkListValueModel;
  final String? checkListSituation;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(MaintenancesTaskQuery.checkListValues),
          variables: MaintenancesTaskVariableQueries.checkListValues(checkListValueModel?.id ?? 0),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
            }
            final resultData = result.data?['checkListValues'].first['CheckItemValue'];
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
                          // ignore: prefer_typing_uninitialized_variables
                          var inputVal;
                          for (var i = 0; i < resultData.length; i++) {
                            if (resultData[i]["CheckItem"].first['id'] ==
                                maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?[index].id) {
                              inputVal = resultData[i]["inputValueParsed"]["value"] ?? '';
                            }
                          }
                          return CustomScopeCheckItemCard(
                            checkItem: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?[index],
                            provider: provider,
                            checkListValueId: checkListValueModel?.id,
                            inputValuee: inputVal ?? '',
                            checkListSituation: checkListSituation,
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
                    // ignore: avoid_print
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
                            labels: checkListValueModel?.labels?.first,
                            saveImage: provider.saveImage,
                          ),
                        );
                      }),
                      _speedDialChild(context, AppIcons.documantScanner, LocaleKeys.AddPdf.tr(), APPColors.NewNotifi.grey, () {
                        ShowModalBottomSheet().show(
                          context,
                          AddDocumentsModalBottomSheet(
                            taskId: checkListValueModel?.id.toString() ?? '',
                            taskKey: checkListValueModel?.key ?? '',
                            labels: checkListValueModel?.labels?.first,
                            function: provider.savePdf,
                          ),
                        );
                      }),
                      _speedDialChild(context, AppIcons.workHistory, LocaleKeys.AddEfforts.tr(), APPColors.Secondary.blue, () {
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
                      _speedDialChild(context, AppIcons.save, LocaleKeys.Save.tr(), APPColors.Main.green, () {
                        ShowModalBottomSheet().show(
                          context,
                          SaveCheckListBottomSheet(
                            checkListValueId: checkListValueModel?.id ?? 0,
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
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
