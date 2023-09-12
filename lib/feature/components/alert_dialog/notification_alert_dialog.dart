import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../product/screens/home/screens/search_work_order/provider/search_work_order_provider.dart';
import '../../extensions/context_extension.dart';

class NotificationAlertDialog {
  static Future showNotification(BuildContext context, SearchWorkOrderProvider searchWorkOrderProvider, RemoteMessage message) async {
    Widget cancelButton = TextButton(
      child: const Text(LocaleKeys.Okey).tr(),
      onPressed: () {
        context.router.pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(LocaleKeys.SeeDetail).tr(),
      onPressed: () {
        searchWorkOrderProvider.getWorkSpaceWithSearchFromGroupWorks(context, message.data['taskId']);
      },
    );

    AlertDialog alert = searchWorkOrderProvider.isLoading
        ? AlertDialog(
            title: Text(LocaleKeys.CreatedNewWorkOrder, style: context.bodyMedium).tr(),
            content: const Text(LocaleKeys.GoingToNewWorkOrderDetailPage).tr(),
            actions: const [],
          )
        : AlertDialog(
            title: Text(LocaleKeys.CreatedNewWorkOrder, style: context.bodyMedium).tr(),
            content: Column(
              children: [
                Text(LocaleKeys.CreatedNewWorkOrder, style: context.bodyMedium).tr(),
                const SizedBox(height: 5),
                Text("${message.data['taskName']} - ${message.data['taskId']}\n${message.data['taskDescription']}"),
              ],
            ),
            actions: [cancelButton, continueButton],
          );
    return showDialog(context: context, builder: (context) => alert);
  }
}
