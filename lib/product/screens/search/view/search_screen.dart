import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_circular_home_button.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../core/route/app_route.gr.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider themeProvider, child) {
        //themeProvider.getPreferences();

        return Scaffold(
            appBar: CustomMainAppbar(title: Text(LocaleKeys.Search.tr())),
            body: Center(child: _bodyWidget(context)));
      }),
    );
  }

  Widget _bodyWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        rowIconButtonSection(
            context,
            LocaleKeys.AssetSearch.tr(),
            AppIcons.assetSearch,
            const AssetSearchScreen(),
            LocaleKeys.SpaceSearch.tr(),
            AppIcons.spaceSearch,
            const SpaceSearchScreen(),
            ServiceTools.isWorkOrderExist),
      ],
    );
  }

  Widget rowIconButtonSection(
      BuildContext context,
      String buttonTitle1,
      IconData buttonIcon1,
      PageRouteInfo<dynamic> navigateRouteName1,
      String buttonTitle2,
      IconData buttonIcon2,
      PageRouteInfo<dynamic> navigateRouteName2,
      bool secondButtonExist) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCircularHomeButton(
              title: buttonTitle1,
              icon: Icon(
                buttonIcon1,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(navigateRouteName1);
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
            secondButtonExist
                ? CustomCircularHomeButton(
                    title: buttonTitle2,
                    icon: Icon(
                      buttonIcon2,
                      size: MediaQuery.of(context).size.width / 10,
                    ),
                    onPressed: () {
                      context.router.push(navigateRouteName2);
                    },
                    isBadgeVisible: false,
                    badgeCount: '0',
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
