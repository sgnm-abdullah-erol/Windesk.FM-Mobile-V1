// ignore_for_file: unrelated_type_equality_checks

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/constants/paths/asset_paths.dart';
import 'package:vm_fm_4/product/screens/home/service/home_service_repo_impl.dart';

import '../../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../../feature/components/internet_conneciton/internet_connection_listener.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/constants/other/app_icons.dart';
import '../../../../feature/constants/other/app_strings.dart';
import '../../../../feature/constants/other/colors.dart';
import '../../../../feature/constants/other/snackbar_strings.dart';
import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/l10n/locale_keys.g.dart';
import '../../../../feature/route/app_route.gr.dart';
import '../provider/home_provider.dart';
import 'announcement_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    HomeServiceRepositoryImpl homeService = HomeServiceRepositoryImpl();
    homeService.getAnnouncements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InternetListenerClass().internetConnection(context);

    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, HomeProvider homeProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (homeProvider.logoutError) {
              snackBar(context, SnackbarStrings.logoutError, 'error');
            }
            if (homeProvider.isUserLogout) {
              snackBar(context, SnackbarStrings.logoutSuccess, 'success');
              context.router.pushAndPopUntil(const LoginScreen(), predicate: (_) => false);
            }
          });
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              appBar: appBarWidget(context, homeProvider),
              backgroundColor: APPColors.Main.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[headerTextWidget(), homePageIcons(context)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded homePageIcons(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          rowIconButtonSection(context, LocaleKeys.issueList, AppIcons.calendarMonth, const TestScreen(), LocaleKeys.issueSearch, AppIcons.attachment,
              const TestScreen()),
          rowIconButtonSection(context, LocaleKeys.workOrderList, AppIcons.contentPasteSearch, const WorkOrderListScreen(),
              LocaleKeys.workOrderSearch, AppIcons.contentPasteOff, const TestScreen()),
        ],
      ),
    );
  }

  Expanded rowIconButtonSection(BuildContext context, String buttonTitle1, IconData buttonIcon1, PageRouteInfo<dynamic> navigateRouteName1,
      String buttonTitle2, IconData buttonIcon2, PageRouteInfo<dynamic> navigateRouteName2) {
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
            CustomCircularHomeButton(
              title: buttonTitle2,
              icon: Icon(
                buttonIcon2,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {},
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          ],
        ),
      ),
    );
  }

  Expanded headerTextWidget() {
    return const Expanded(
      child: Column(
        children: [
          Text(ServiceTools.facilityName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          Text(AppStrings.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  AppBar appBarWidget(BuildContext context, HomeProvider provider) {
    return AppBar(
      title: Image.asset(
        AssetPaths.windesk,
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.width / 1.2,
        fit: BoxFit.cover,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(AppIcons.powerSettingsOff, size: 35, color: APPColors.Main.black),
          tooltip: AppStrings.logout,
          onPressed: () {
            provider.logOut();
          },
        ),
      ],
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: APPColors.Main.white,
      leading: announcementBuilder(),
    );
  }

  Builder announcementBuilder() {
    return Builder(
      builder: (BuildContext context) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: 10, end: 10),
          badgeContent: Text(
            context.read<HomeProvider>().totalAnnoucementCount.toString(),
            style: TextStyle(color: APPColors.Main.white),
          ),
          onTap: () {},
          child: IconButton(
            icon: Icon(
              AppIcons.notifications,
              size: 35,
              color: APPColors.Main.black,
            ),
            onPressed: () {
              context.read<HomeProvider>().totalAnnoucementCount.toString() != 0
                  ? showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      elevation: 10,
                      context: context,
                      builder: (context) => const AnnouncementList())
                  : null;
            },
          ),
        );
      },
    );
  }
}
