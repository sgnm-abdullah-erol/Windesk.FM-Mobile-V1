import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../feature/constants/other/colors.dart';
import '../../../feature/constants/paths/service_tools.dart';
import '../../../feature/l10n/locale_keys.g.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   TestServiceRepositoryImpl x = TestServiceRepositoryImpl();
  //   x.accessTestMobileService();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: APPColors.Main.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              headerWidget(),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    rowIconButtonSection(LocaleKeys.issueList, Icons.calendar_month, '', LocaleKeys.issueSearch, Icons.attachment, ''),
                    rowIconButtonSection(
                        LocaleKeys.workOrderList, Icons.content_paste_search, '', LocaleKeys.workOrderSearch, Icons.content_paste_off, ''),
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: HomeButton(
                    //             text: 'Yeni İş Emri',
                    //             iconName: Icons.calendar_month,
                    //             navigator: ComplaintRequests()),
                    //       ),
                    //       // Expanded(
                    //       //   child: HomeButton(
                    //       //       text: 'Kapatılmış Taleplerim',
                    //       //       iconName: Icons.attachment,
                    //       //       navigator: ClosedRequests()),
                    //       // )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded rowIconButtonSection(title1, icon1, func1, title2, icon2, func2) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CustomCircularHomeButton(
              title: title1,
              icon: Icon(icon1),
              onPressed: () {},
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          ),
          CustomCircularHomeButton(
            title: title2,
            icon: Icon(icon2),
            onPressed: () {},
            isBadgeVisible: false,
            badgeCount: '0',
          ),
        ],
      ),
    );
  }

  Expanded headerWidget() {
    return const Expanded(
        child: Column(
      children: [
        Text(
          ServiceTools.facilityName,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Text(
          'Yardım Masası Uygulaması',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }

  // AppBar AppBarWidget(BuildContext context) {
  //   return AppBar(
  //       title: Image.asset(
  //         'lib/assets/images/windesk.jpg',
  //         width: MediaQuery.of(context).size.width / 1.2,
  //         height: MediaQuery.of(context).size.width / 1.2,
  //         fit: BoxFit.cover,
  //       ),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: Icon(
  //             Icons.power_settings_new,
  //             size: 35,
  //             color: APPColors.Main.black,
  //           ),
  //           tooltip: 'Exit',
  //           onPressed: () async {
  //             var cikisResult =
  //                 await apirepository.cikis(mainViewProvider.kadi);
  //             try {
  //               if (cikisResult) {
  //                 snackBar(context, 'Çıkış İşlemi Başarılı', 'success');

  //                 Future.delayed(const Duration(seconds: 1)).whenComplete(() {
  //                   Phoenix.rebirth(context);
  //                 });
  //               } else {}
  //             } catch (e) {
  //               snackBar(context, 'Çıkış İşlemi Başarısız', 'error');
  //             }
  //           },
  //         ),
  //       ],
  //       centerTitle: true,
  //       elevation: 0.0,
  //       backgroundColor: APPColors.Main.white,
  //       leading: Builder(
  //         builder: (BuildContext context) {
  //           return badges.Badge(
  //             position: badges.BadgePosition.topEnd(top: 10, end: 10),
  //             badgeContent: Text(
  //               mainViewProvider.toplamKayitSayisi.toString(),
  //               style: TextStyle(color: APPColors.Main.white),
  //             ),
  //             onTap: () {},
  //             child: IconButton(
  //               icon: Icon(
  //                 Icons.notifications,
  //                 size: 35,
  //                 color: APPColors.Main.black,
  //               ),
  //               onPressed: () {
  //                 // ignore: unrelated_type_equality_checks
  //                 mainViewProvider.toplamKayitSayisi != 0
  //                     ? showModalBottomSheet<void>(
  //                         isScrollControlled: true,
  //                         backgroundColor: Colors.transparent,
  //                         elevation: 10,
  //                         context: context,
  //                         builder: (context) => const AnnouncementList())
  //                     : null;
  //               },
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //     centerTitle: true,
  //     elevation: 0.0,
  //     backgroundColor: APPColors.Main.white,
  //     leading: Builder(
  //       builder: (BuildContext context) {
  //         return badges.Badge(
  //           position: badges.BadgePosition.topEnd(top: 10, end: 10),
  //           badgeContent: Text(
  //             mainViewProvider.toplamKayitSayisi.toString(),
  //             style: TextStyle(color: APPColors.Main.white),
  //           ),
  //           onTap: () {},
  //           child: IconButton(
  //             icon: Icon(
  //               Icons.notifications,
  //               size: 35,
  //               color: APPColors.Main.black,
  //             ),
  //             onPressed: () {
  //               // ignore: unrelated_type_equality_checks
  //               mainViewProvider.toplamKayitSayisi != 0
  //                   ? showModalBottomSheet<void>(
  //                       isScrollControlled: true,
  //                       backgroundColor: Colors.transparent,
  //                       elevation: 10,
  //                       context: context,
  //                       builder: (context) => AnnouncementList())
  //                   : null;
  //             },
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
