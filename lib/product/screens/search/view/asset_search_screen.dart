// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';

import '../../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../core/constants/other/app_icons.dart';
import '../../../../core/constants/style/custom_paddings.dart';
import '../../../../core/route/app_route.gr.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/search_provider.dart';

@RoutePage()
class AssetSearchScreen extends StatefulWidget {
  const AssetSearchScreen({super.key});

  @override
  State<AssetSearchScreen> createState() => _AssetSearchScreen();
}

class _AssetSearchScreen extends State<AssetSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchMaterialProvider(),
      child: Consumer<SearchMaterialProvider>(builder: (context, SearchMaterialProvider searchProvider, child) {
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
            appBar: CustomMainAppbar(returnBack: true, title: const Text(LocaleKeys.MaterialSearch).tr(), elevation: 3),
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
                              labelText: LocaleKeys.MaterialSearch,
                              actionIcon: AppIcons.qr,
                              actionFunction: searchProvider.scanBarcodeAndQrForAsset),
                          DropDownInputFields(
                              labelText: 'Arama Türü',
                              onChangedFunction: (String value) {
                                searchProvider.setQrType(value);
                              },
                              rightIcon: AppIcons.arrowDown,
                              dropDownArray: const ['Etiket Numarası', 'Varlık Tanımlayıcı']),
                          CustomHalfButtons(
                              leftTitle: Text(LocaleKeys.Clear.tr(), style: context.bodyMedium),
                              rightTitle: Text(LocaleKeys.Search.tr(), style: context.bodyMedium),
                              leftOnPressed: searchProvider.clearInput,
                              rightOnPressed: searchProvider.getAssetWithSearch),
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
