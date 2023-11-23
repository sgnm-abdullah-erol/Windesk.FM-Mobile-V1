import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/l10n/x.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    IconData _themeIcon = context.read<ThemeProvider>().isDark ? AppIcons.darkMode : AppIcons.lightMode;

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
              Icon(_themeIcon),
              Switch(
                value: context.read<ThemeProvider>().isDark,
                onChanged: (value) {
                  widget.themeProvider.setTheme(widget.themeProvider.isDark ? false : true);
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
