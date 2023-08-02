import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/route/app_route.gr.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';

import '../../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../../feature/constants/style/custom_paddings.dart';
import '../provider/search_provider.dart';

@RoutePage()
class SearchMaterialScreen extends StatefulWidget {
  const SearchMaterialScreen({super.key});

  @override
  State<SearchMaterialScreen> createState() => _SearchMaterialScreenState();
}

class _SearchMaterialScreenState extends State<SearchMaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchMaterialProvider(),
      child: Consumer<SearchMaterialProvider>(builder: (context, SearchMaterialProvider searchProvider, child) {
        if (searchProvider.isSuccess) {
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

        return Scaffold(
          appBar: const CustomMainAppbar(title: Text(AppStrings.materialSearch), elevation: 3),
          body: searchProvider.isLoading
              ? const CustomLoadingIndicator()
              : Center(
                  child: Padding(
                    padding: CustomPaddings.pageNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldsInputWithActionAndController(
                            textController: searchProvider.assetNumber,
                            labelText: AppStrings.materialSearch,
                            actionIcon: AppIcons.qr,
                            actionFunction: searchProvider.scanBarcodeAndQrForAsset),
                        CustomHalfButtons(
                            leftTitle: const Text(
                              AppStrings.clean,
                              style: TextStyle(color: Colors.white),
                            ),
                            rightTitle: const Text(
                              AppStrings.search,
                              style: TextStyle(color: Colors.white),
                            ),
                            leftOnPressed: searchProvider.clearInput,
                            rightOnPressed: searchProvider.getAssetWithSearch),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
