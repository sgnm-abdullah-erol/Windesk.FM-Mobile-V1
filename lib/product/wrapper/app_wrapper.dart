import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/constants/other/app_icons.dart';
import '../../core/route/app_route.gr.dart';
import '../../feature/extensions/context_extension.dart';
import '../../generated/locale_keys.g.dart';

@RoutePage()
class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeScreen(),
        NewOrderScreen(),
        SearchScreen(),
        TestScreen()
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: tabsRouter.activeIndex,
            onItemSelected: tabsRouter.setActiveIndex,
            items: [
              BottomNavyBarItem(
                  title:
                      Text(LocaleKeys.HomeTab, style: context.labelMedium).tr(),
                  icon: const Icon(AppIcons.home)),
              BottomNavyBarItem(
                  title:
                      Text(LocaleKeys.NewOrderTab, style: context.labelMedium)
                          .tr(),
                  icon: const Icon(AppIcons.addBox)),
              BottomNavyBarItem(
                  title: Text(LocaleKeys.SearchTab, style: context.labelMedium)
                      .tr(),
                  icon: const Icon(AppIcons.search)),
              BottomNavyBarItem(
                  title:
                      Text(LocaleKeys.TestTab, style: context.labelMedium).tr(),
                  icon: const Icon(AppIcons.wifi)),
            ],
          ),
        );
      },
    );
  }
}
