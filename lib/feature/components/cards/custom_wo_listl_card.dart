// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/feature/constants/other/time_functions.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/l10n/locale_keys.g.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';
import '../../constants/style/font_sizes.dart';

class CustomWoDetailCard extends StatelessWidget {
  final String? id, code, statusName, service, serviceName, moduleLocation, name, responsible, plannedEndDate;

  final Color? importanceLevelColor;
  final VoidCallback? press;
  final bool isIcon;
  final Function onPressed;

  const CustomWoDetailCard({
    Key? key,
    this.code,
    this.id,
    this.moduleLocation,
    this.name,
    this.plannedEndDate,
    this.service,
    this.responsible,
    this.serviceName,
    this.importanceLevelColor,
    this.statusName,
    this.press,
    this.isIcon = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onPressed(code.toString());
      },
      child: Container(
        width: size.width / 1.1,
        decoration: BoxDecoration(
          borderRadius: CustomBorderRadius.mediumBorderRadius,
          boxShadow: const [BoxShadow(color: Color(0x19025273), blurRadius: 50, offset: Offset(6, 8))],
          color: APPColors.Main.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              codeAndStatusWidget(size),
              Divider(height: 10),
              woListText(serviceName),
              woListText(serviceName),
            ],
          ),
        ),
      ),
    );
  }

  Flexible codeAndStatusWidget(Size size) {
    return Flexible(
      child: SizedBox(
        width: size.width / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                code.toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: APPColors.Secondary.black,
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                statusName.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: APPColors.Secondary.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column woListText(header) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: TextStyle(
                  color: APPColors.Secondary.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 15,
        ),
      ],
    );
  }


  Flexible issueListText(Size size, String header, String description) {
    return Flexible(
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: CustomPaddings.onlyBottomLow,
                child: Text('$header : $description', style: const TextStyle(
    color: Color(0xff025273),
    fontSize: FontSizes.caption - 1,
  )),
              ),
            ),
            Divider(height: 5),
          ],
        ),
      ),
    );
  }
}
