// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

class CustomMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainAppbar({
    Key? key,
    required this.title,
    this.leading,
    this.returnBack,
    this.actions,
    this.elevation,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? returnBack;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title.tr()),
      titleTextStyle: title is Text
          ? context.bodyMedium.copyWith(fontWeight: FontWeight.bold)
          : null,
      centerTitle: true,
      leading: returnBack == true
          ? IconButton(
              onPressed: () => Navigator.pop<bool>(context, true),
              icon: Icon(Icons.arrow_back_ios,
                  color: context.theme
                      ? APPColors.Clear.white
                      : APPColors.Main.black),
            )
          : leading,
      automaticallyImplyLeading: returnBack ?? false,
      actions: actions != null ? actions! : [],
      backgroundColor:
          context.theme ? APPColors.Modal.black : APPColors.Main.white,
      elevation: elevation ?? 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
