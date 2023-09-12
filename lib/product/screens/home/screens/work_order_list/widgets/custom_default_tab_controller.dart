import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';

class CustomDefaultTabController extends StatelessWidget {
  const CustomDefaultTabController({super.key, required this.provider, required this.tabs});

  final WorkOrderListProvider provider;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: provider.tabIndex,
      length: 3,
      child: SizedBox(
        height: 50,
        child: TabBar(
          indicatorColor: context.theme ? APPColors.Main.white : APPColors.Main.black,
          onTap: (value) => provider.changeTab(value),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: context.theme ? APPColors.Main.white : APPColors.Main.blue,
          labelStyle: context.labelMedium,
          unselectedLabelStyle: context.labelMedium,
          tabs: tabs,
        ),
      ),
    );
  }
}
