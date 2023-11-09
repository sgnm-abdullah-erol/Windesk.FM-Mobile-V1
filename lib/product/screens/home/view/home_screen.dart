// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/paths/asset_paths.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';
import 'package:vm_fm_4/feature/components/alert_dialog/notification_alert_dialog.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/service/home_service_repo_impl.dart';

import '../../../../core/constants/other/app_icons.dart';
import '../../../../core/constants/other/colors.dart';
import '../../../../core/route/app_route.gr.dart';
import '../../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../../feature/components/internet_conneciton/internet_connection_listener.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import '../provider/home_provider.dart';
import '../screens/search_work_order/provider/search_work_order_provider.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchWorkOrderProvider>(create: (_) => SearchWorkOrderProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: Consumer2<HomeProvider, SearchWorkOrderProvider>(
        builder: (context, HomeProvider homeProvider, SearchWorkOrderProvider searchWorkOrderProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (homeProvider.logoutError) {
              snackBar(context, LocaleKeys.LogoutError.tr(), 'error');
            }
            if (homeProvider.isUserLogout) {
              snackBar(context, LocaleKeys.LogoutSuccess.tr(), 'success');
              context.router.pushAndPopUntil(LoginScreen(userName: homeProvider.userName), predicate: (_) => false);
            }
          });
          final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();
          FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
            //TODO MESSAGE PARSE

            NotificationAlertDialog.showNotification(context, searchWorkOrderProvider, message);
            //FlutterLocalNotificationsPlugin().show(message.notification.messageId, message.notification?.title, message.notification?.body,);
          });

          // TODO DUMMY THEME, CHANGE LANGUAGE BUTTON
          return Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) {
              return Scaffold(
                key: _scaffoldKey,
                appBar: appBarWidget(context, homeProvider),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[headerTextWidget(context), homePageIcons(context)],
                  ),
                ),
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "1",
                      onPressed: () {
                        themeProvider.setTheme(!themeProvider.isDark);
                      },
                    ),
                    FloatingActionButton(
                      heroTag: "2",
                      onPressed: () {
                        if (context.locale == const Locale('en', 'US')) {
                          context.setLocale(const Locale('tr', 'TR'));
                        } else {
                          context.setLocale(const Locale('en', 'US'));
                        }
                      },
                    ),
                  ],
                ),
              );
            },
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
          rowIconButtonSection(
            context,
            LocaleKeys.CaseSlaList,
            AppIcons.calendarMonth,
            const TestScreen(),
            LocaleKeys.CaseSlaSearch,
            AppIcons.attachment,
            const TestScreen(),
          ),
          rowIconButtonSection(
            context,
            LocaleKeys.WorkOrderList,
            AppIcons.contentPasteSearch,
            const WorkOrderListScreen(),
            LocaleKeys.WorkOrderSearch,
            AppIcons.contentPasteOff,
            const SearchWorkOrderScreen(),
          ),
        ],
      ),
    );
  }

  Expanded rowIconButtonSection(
    BuildContext context,
    String buttonTitle1,
    IconData buttonIcon1,
    PageRouteInfo<dynamic> navigateRouteName1,
    String buttonTitle2,
    IconData buttonIcon2,
    PageRouteInfo<dynamic> navigateRouteName2,
  ) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCircularHomeButton(
              title: buttonTitle1,
              icon: Icon(buttonIcon1, size: context.width / 10),
              onPressed: () => context.router.push(navigateRouteName1),
              isBadgeVisible: false,
              badgeCount: '0',
            ),
            CustomCircularHomeButton(
              title: buttonTitle2,
              icon: Icon(buttonIcon2, size: context.width / 10),
              onPressed: () => context.router.push(navigateRouteName2),
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          ],
        ),
      ),
    );
  }

  Expanded headerTextWidget(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(LocaleKeys.IfmName, style: context.titleSmall.copyWith(letterSpacing: 1.5)).tr(),
          Text(LocaleKeys.AppTitle, style: context.titleMedium.copyWith(letterSpacing: 1.5)).tr(),
        ],
      ),
    );
  }

  AppBar appBarWidget(BuildContext context, HomeProvider provider) {
    return AppBar(
      title: Image.asset(AssetPaths.windesk, width: context.width / 1.2, height: context.width / 1.2, fit: BoxFit.cover),
      actions: <Widget>[
        IconButton(
          icon: Icon(AppIcons.powerSettingsOff, size: 35, color: context.theme ? APPColors.Main.white : APPColors.Main.black),
          tooltip: LocaleKeys.HintLogout.tr(),
          onPressed: () => provider.logOut(context),
        ),
      ],
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: APPColors.Clear.black,
      leading: announcementBuilder(context),
    );
  }

  Builder announcementBuilder(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: 10, end: 10),
          badgeContent: Text(
            context.read<HomeProvider>().totalAnnoucementCount.toString(),
            style: context.labelMedium.copyWith(color: APPColors.Main.white),
          ),
          onTap: () {},
          child: IconButton(
            icon: Icon(
              AppIcons.notifications,
              size: 35,
              color: context.theme ? APPColors.Main.white : APPColors.Main.black,
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
