import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../core/constants/style/font_sizes.dart';
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
          indicatorColor: APPColors.Main.black,
          onTap: (value) => provider.changeTab(value),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: APPColors.Main.blue,
          labelStyle: _labelStyle(),
          unselectedLabelStyle: _labelStyle(),
          tabs: tabs,
        ),
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      color: APPColors.Login.blue,
      fontWeight: FontWeight.bold,
      fontSize: FontSizes.caption,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
    );
  }
}
