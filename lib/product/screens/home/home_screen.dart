import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/paths/service_tools.dart';
import 'package:vm_fm_4/product/screens/test/service/test_service_repo_impl.dart';

import '../../../feature/components/cards/custom_issue_detail_card.dart';
import '../../../feature/constants/other/colors.dart';

//s
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    TestServiceRepositoryImpl x = TestServiceRepositoryImpl();
    x.accessTestMobileService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(context),
      backgroundColor: APPColors.Main.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Expanded(
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
            )),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: HomeButton(
                              text: LocaleKeys.vakaList.tr(),
                              iconName: Icons.calendar_month,
                              navigator: Issue()),
                        ),
                        Expanded(
                          child: HomeButton(
                              text: LocaleKeys.vakaArama.tr(),
                              iconName: Icons.attachment,
                              navigator: NewNotif()),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: HomeButton(
                              text: LocaleKeys.isEmriList,
                              iconName: Icons.content_paste_search,
                              navigator: WoTracingList()),
                        ),
                        Expanded(
                          child: HomeButton(
                              text: LocaleKeys.isEmriArama,
                              iconName: Icons.content_paste_off,
                              navigator: CloseRequestAwaitApproval()),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: HomeButton(
                              text: 'Yeni İş Emri',
                              iconName: Icons.calendar_month,
                              navigator: ComplaintRequests()),
                        ),
                        // Expanded(
                        //   child: HomeButton(
                        //       text: 'Kapatılmış Taleplerim',
                        //       iconName: Icons.attachment,
                        //       navigator: ClosedRequests()),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),);
  }

  AppBar AppBarWidget(BuildContext context) {
    return AppBar(
        title: Image.asset(
          'lib/assets/images/windesk.jpg',
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.width / 1.2,
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
              size: 35,
              color: APPColors.Main.black,
            ),
            tooltip: 'Exit',
            onPressed: () async {
              var cikisResult =
                  await apirepository.cikis(mainViewProvider.kadi);
              try {
                if (cikisResult) {
                  snackBar(context, 'Çıkış İşlemi Başarılı', 'success');

                  Future.delayed(const Duration(seconds: 1)).whenComplete(() {
                    Phoenix.rebirth(context);
                  });
                } else {}
              } catch (e) {
                snackBar(context, 'Çıkış İşlemi Başarısız', 'error');
              }
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: APPColors.Main.white,
        leading: Builder(
          builder: (BuildContext context) {
            return badges.Badge(
              position: badges.BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: Text(
                mainViewProvider.toplamKayitSayisi.toString(),
                style: TextStyle(color: APPColors.Main.white),
              ),
              onTap: () {},
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 35,
                  color: APPColors.Main.black,
                ),
                onPressed: () {
                  // ignore: unrelated_type_equality_checks
                  mainViewProvider.toplamKayitSayisi != 0
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
        ),
      ],
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: APPColors.Main.white,
      leading: Builder(
        builder: (BuildContext context) {
          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: Text(
              mainViewProvider.toplamKayitSayisi.toString(),
              style: TextStyle(color: APPColors.Main.white),
            ),
            onTap: () {},
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                size: 35,
                color: APPColors.Main.black,
              ),
              onPressed: () {
                // ignore: unrelated_type_equality_checks
                mainViewProvider.toplamKayitSayisi != 0
                    ? showModalBottomSheet<void>(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                        context: context,
                        builder: (context) => AnnouncementList())
                    : null;
              },
            ),
          );
        },
      ),
    );
  }
}
