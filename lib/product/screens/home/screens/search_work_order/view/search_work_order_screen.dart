import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../core/constants/style/custom_paddings.dart';
import '../../../../../../core/route/app_route.gr.dart';
import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/search_work_order_provider.dart';

@RoutePage()
class SearchWorkOrderScreen extends StatelessWidget {
  const SearchWorkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchWorkOrderProvider(),
      child: Consumer<SearchWorkOrderProvider>(builder: (context, SearchWorkOrderProvider searchProvider, child) {
        if (searchProvider.isSuccess) {
          if (searchProvider.woDetailList != null) {
            context.router.push(DetailWorkOrderScreen(workSpaceDetail: searchProvider.woDetailList!));
            searchProvider.clearInput();
          }
        }

        return Scaffold(
          appBar: const CustomMainAppbar(title: (LocaleKeys.WorkOrderSearch), returnBack: true, elevation: 3),
          body: searchProvider.isLoading
              ? const CustomLoadingIndicator()
              : Center(
                  child: Padding(
                    padding: CustomPaddings.pageNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LocaleKeys.WorkOrderSample.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            TextFieldsInputWithActionAndController(
                                textController: searchProvider.woNumber,
                                labelText: LocaleKeys.WorkOrderNumber,
                                actionIcon: AppIcons.qr,
                                actionFunction: searchProvider.scanBarcodeAndQr),
                          ],
                        ),
                        CustomHalfButtons(
                            leftTitle: LocaleKeys.Clear,
                            rightTitle: LocaleKeys.Search,
                            leftOnPressed: searchProvider.clearInput,
                            rightOnPressed: searchProvider.getWorkOrderWithSearch),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
