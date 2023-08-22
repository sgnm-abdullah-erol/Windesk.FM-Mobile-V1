// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:firebase_messaging/firebase_messaging.dart';
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
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/l10n/locale_keys.g.dart';
import '../../../../feature/route/app_route.gr.dart';
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
              snackBar(context, SnackbarStrings.logoutError, 'error');
            }
            if (homeProvider.isUserLogout) {
              snackBar(context, SnackbarStrings.logoutSuccess, 'success');
              context.router.pushAndPopUntil(const LoginScreen(), predicate: (_) => false);
            }
          });
          final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();
          FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
            showAlertDialog(BuildContext context) {
              // set up the buttons
              Widget cancelButton = TextButton(
                child: const Text("Tamam"),
                onPressed: () {
                  context.router.pop();
                },
              );
              Widget continueButton = TextButton(
                child: const Text("Detayı Gör"),
                onPressed: () async {
                  String userToken = await SharedManager().getString(SharedEnum.userToken);
                  final result = await workSpaceService.getWorkSpaceWithSearchFromGroupWorks(message.data['taskId'], userToken);

                  result.fold(
                      (l) => {
                            context.router.push(DetailWorkOrderScreen(workSpaceDetail: l)),
                            context.router.pop(),
                          },
                      (r) {});
                },
              );

              // set up the AlertDialog
              AlertDialog alert = searchWorkOrderProvider.isLoading
                  ? AlertDialog(
                      title: Text(
                        "Yeni bir İş Emri Oluşturuldu",
                        style: TextStyle(color: APPColors.Main.black),
                      ),
                      content: const Text("İş emri detayına gidiliyor lütfen bekleyiniz..."),
                      actions: const [],
                    )
                  : AlertDialog(
                      title: Text(
                        "Yeni bir İş Emri Oluşturuldu",
                        style: TextStyle(color: APPColors.Main.black),
                      ),
                      content: Text(
                          "Yeni bir iş emri oluşturuldu.\n${message.data['taskName']} - ${message.data['taskId']}\n${message.data['taskDescription']}"),
                      actions: [
                        cancelButton,
                        continueButton,
                      ],
                    );

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }

            showAlertDialog(context);

            //FlutterLocalNotificationsPlugin().show(message.notification.messageId, message.notification?.title, message.notification?.body,);
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
              LocaleKeys.workOrderSearch, AppIcons.contentPasteOff, const SearchWorkOrderScreen()),
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
              onPressed: () {
                context.router.push(navigateRouteName2);
              },
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
