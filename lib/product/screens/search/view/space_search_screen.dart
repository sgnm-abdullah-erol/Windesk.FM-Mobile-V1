import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';

import '../../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../core/constants/other/app_icons.dart';
import '../../../../core/constants/style/custom_paddings.dart';
import '../../../../core/route/app_route.gr.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/search_provider.dart';

@RoutePage()
class SpaceSearchScreen extends StatefulWidget {
  const SpaceSearchScreen({super.key});

  @override
  State<SpaceSearchScreen> createState() => _SpaceSearchScreen();
}

class _SpaceSearchScreen extends State<SpaceSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchMaterialProvider(),
      child: Consumer<SearchMaterialProvider>(
          builder: (context, SearchMaterialProvider searchProvider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (searchProvider.isSuccess) {
            snackBar(context, LocaleKeys.assetSearchSuccess, 'success');
            if (searchProvider.assetDetailList != null) {
              context.router.push(AssetDetailScreen(
                  assetListModel: searchProvider.assetDetailList!,
                  assetImageModel: searchProvider.imageModel,
                  imageExist: searchProvider.imageExist,
                  documentExist: searchProvider.documentExist,
                  assetDocumentModel: searchProvider.documentModel));
              searchProvider.clearInput();
            }
          }
          if (searchProvider.errorAccure) {
            snackBar(context, LocaleKeys.assetSearchError, 'error');
          }
          
        });
        return WillPopScope(
          child: Scaffold(
            appBar: CustomMainAppbar(
                returnBack: true,
                title: const Text(LocaleKeys.spaceSearch).tr(),
                elevation: 3),
            body: searchProvider.isLoading
                ? const CustomLoadingIndicator()
                : Center(
                    child: Padding(
                      padding: CustomPaddings.pageNormal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFieldsInputWithActionAndController(
                              textController: searchProvider.spaceText,
                              labelText: LocaleKeys.spaceSearch,
                              actionIcon: AppIcons.search,
                              actionFunction: () {
                                searchProvider.spaceSearch(context);
                              }),
                          searchProvider.spaceData != null
                              ? Expanded(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: TreeView(nodes: [
                                            for (var i = 0;
                                                i <
                                                    searchProvider
                                                        .spaceData!['children']
                                                        .length;
                                                i++) ...{
                                              TreeNode(
                                                  content: Text(
                                                    searchProvider.spaceData![
                                                        'children'][i]['name'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  children: [
                                                    for (var x = 0;
                                                        x <
                                                            searchProvider
                                                                .spaceData![
                                                                    'children']
                                                                    [i]
                                                                    ["children"]
                                                                .length;
                                                        x++) ...{
                                                      TreeNode(
                                                          content: Text(
                                                            searchProvider.spaceData![
                                                                        'children']
                                                                    [
                                                                    i]["children"]
                                                                [x]['name'],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          children: [
                                                            for (var y = 0;
                                                                y <
                                                                    searchProvider
                                                                        .spaceData![
                                                                            'children']
                                                                            [i][
                                                                            "children"]
                                                                            [x][
                                                                            'children']
                                                                        .length;
                                                                y++) ...{
                                                              TreeNode(
                                                                  content: Text(searchProvider.spaceData!['children'][i]["children"]
                                                                              [
                                                                              x]
                                                                          [
                                                                          'children']
                                                                      [
                                                                      y]['name']),
                                                                  children: [
                                                                    for (var z =
                                                                            0;
                                                                        z < searchProvider.spaceData!['children'][i]["children"][x]['children'][y]['children'].length;
                                                                        z++) ...{
                                                                      TreeNode(
                                                                          content: Text(searchProvider.spaceData!['children'][i]["children"][x]['children'][y]['children'][z]['architecturalCode'] +
                                                                              '/' +
                                                                              searchProvider.spaceData!['children'][i]["children"][x]['children'][y]['children'][z]['name'])),
                                                                    }
                                                                  ]),
                                                            }
                                                          ]),
                                                    }
                                                  ]),
                                            },
                                          ]),
                                        ),
                                      )))
                              : Text(
                                  'Listelemek için lütfen arama yapınız.',
                                  style: TextStyle(fontSize: 13),
                                )
                          // CustomHalfButtons(
                          //     leftTitle: Text(LocaleKeys.Clear.tr(),
                          //         style: context.bodyMedium),
                          //     rightTitle: Text(LocaleKeys.Search.tr(),
                          //         style: context.bodyMedium),
                          //     leftOnPressed: searchProvider.clearInput,
                          //     rightOnPressed: searchProvider.spaceSearch),
                        ],
                      ),
                    ),
                  ),
          ),
          onWillPop: () async => false,
        );
      }),
    );
  }
}
