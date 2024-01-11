import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/l10n/x.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    fetchUsers() async {
      final file = File('../../../../');
      var result =
          await http.get(Uri.parse("http://138.201.186.190:32664/ifm/documents/mobile/languageFile/v1.0.7/en/8be9067c2d458865e9689e578ac497fc.json"));
      //print(result.body);
      //print(jsonDecode(result.body));
    }

    IconData themeIcon = context.read<ThemeProvider>().isDark ? AppIcons.darkMode : AppIcons.lightMode;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LocaleKeys.Settings.tr(), style: Theme.of(context).textTheme.bodyMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    fetchUsers();
                  },
                  child: const Text('indir')),
              Icon(themeIcon),
              Switch(
                value: context.read<ThemeProvider>().isDark,
                onChanged: (value) {
                  themeProvider.setTheme(themeProvider.isDark ? false : true);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(AppIcons.language),
              Switch(
                value: context.locale == const Locale('en', 'US'),
                onChanged: (value) {
                  if (context.locale == const Locale('en', 'US')) {
                    context.setLocale(const Locale('tr', 'TR'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
