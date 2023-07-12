// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

import '../../../feature/components/buttons/custom_exit_button.dart';
import '../../../feature/constants/other/colors.dart';
import '../../../feature/models/home_page_models/announcement_model.dart';
import 'home_provider.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int l = -1;
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(builder: (context, HomeProvider homeProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            height: size.height / 1.4,
            alignment: Alignment.center,
            child: Column(
              children: [
                CustomExitButton(title: 'Duyuruları Kapat', onTap: () {Navigator.pop(context);}),
                context.read<HomeProvider>().announcementList.isNotEmpty
                    ? Expanded(
                        child: NotificationListener<ScrollNotification>(
                        child: ListView.builder(
                            itemCount: context.read<HomeProvider>().totalAnnoucementCount,
                            itemBuilder: (BuildContext context, int i) {
                              l++;
                              if (l == 5) {
                                l = 0;
                              }
                              AnnouncementModel listElements = context.read<HomeProvider>().announcementList[i];
                              bool? isLink = listElements.announcement?.contains('http');
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: APPColors.Main.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: APPColors.Main.grey,
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            listElements.name.toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 18, color: APPColors.Accent.blue),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: isLink == true
                                                ? Link(
                                                    uri: Uri.parse(listElements.announcement.toString()),
                                                    target: LinkTarget.blank,
                                                    builder: (BuildContext ctx, FollowLink? openLink) {
                                                      return TextButton.icon(
                                                        onPressed: openLink,
                                                        label: const Text('Ankete Git : '),
                                                        icon: const Icon(Icons.read_more),
                                                      );
                                                    },
                                                  )
                                                : Text(
                                                    listElements.announcement.toString(),
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 15, color: APPColors.Secondary.black),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ))
                    : Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
                        child: const Center(child: AramaSonucBos()),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Padding closeAnnouncemeent(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text(
                    'Duyuruları Kapat',
                    style: TextStyle(color: APPColors.Main.white, fontSize: 16),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              );
  }
}

class AramaSonucBos extends StatelessWidget {
  const AramaSonucBos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: const ListTile(
          leading: Icon(Icons.info),
          subtitle: Text(
            "Aradığınız Arama Kriterlerine Ait Bilgi Bulunamamıştır.",
          ),
        ));
  }
}
