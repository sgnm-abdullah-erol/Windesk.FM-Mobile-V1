import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input_with_action.dart';
import 'package:vm_fm_4/feature/constants/other/app_icons.dart';

import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/components/buttons/custom_elevated_button_with_icon.dart';
import '../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../../../../../../feature/constants/style/custom_paddings.dart';
import '../../../../../../feature/route/app_route.gr.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/search_work_order_provider.dart';

@RoutePage()
class SearchWorkOrderScreen extends StatefulWidget {
  const SearchWorkOrderScreen({super.key});

  @override
  State<SearchWorkOrderScreen> createState() => _SearchWorkOrderScreenState();
}

class _SearchWorkOrderScreenState extends State<SearchWorkOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchWorkOrderProvider(),
      child: Consumer<SearchWorkOrderProvider>(
          builder: (context, SearchWorkOrderProvider searchProvider, child) {
        searchProvider.isSuccess
            ? searchProvider.woDetailList != null
                ? context.router.push(DetailWorkOrderScreen(
                    workSpaceDetail: searchProvider.woDetailList!))
                : null
            : null;

        test() {
          print('a');
        }

        return Scaffold(
          appBar: const CustomMainAppbar(
              title: Text(AppStrings.workOrderSearch),
              returnBack: true,
              elevation: 3),
          body: searchProvider.isLoading
              ? const CustomLoadingIndicator()
              : Center(
                  child: Padding(
                    padding: CustomPaddings.pageNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldsInputWithActionAndController(
                            textController: searchProvider.woNumber,
                            labelText: 'İş Emri Arama',
                            actionIcon: AppIcons.qr,
                            actionFunction: searchProvider.scanBarcodeAndQr),
                        CustomHalfButtons(
                            leftTitle: Text('Temizle'),
                            rightTitle: Text('Ara'),
                            leftOnPressed: searchProvider.clearInput,
                            rightOnPressed:
                                searchProvider.getWorkOrderWithSearch)
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
