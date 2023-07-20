import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/buttons/custom_elevated_button_with_icon.dart';
import '../../../../../../feature/components/input_fields/text_fields_search.dart';
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
      child: Consumer<SearchWorkOrderProvider>(builder: (context, SearchWorkOrderProvider searchProvider, child) {
        searchProvider.isSuccess
            ? searchProvider.woDetailList != null
                ? context.router.push(DetailWorkOrderScreen(workSpaceDetail: searchProvider.woDetailList!))
                : null
            : null;
        return Scaffold(
          appBar: AppBar(),
          body: searchProvider.isLoading
              ? const CustomLoadingIndicator()
              : Center(
                  child: Padding(
                    padding: CustomPaddings.pageNormal,
                    child: Column(
                      children: [
                        TextFieldSearch(onChangedFunction: searchProvider.onChangedFunction),
                        CustomElevatedButtonWithIcon(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 20,
                          bgColor: APPColors.Modal.blue,
                          textValue: 'Ara',
                          textColor: APPColors.Main.white,
                          icon: Icons.send,
                          iconColor: APPColors.Main.white,
                          onPressFunction: () => searchProvider.getWorkOrderWithSearch(searchProvider.woNumber),
                        )
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
