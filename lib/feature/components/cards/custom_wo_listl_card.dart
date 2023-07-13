// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/box_decorations.dart';
import '../buttons/custom_half_buttons.dart';

class CustomWoDetailCard extends StatelessWidget {
  final String? id, code, statusName, service, serviceName, moduleLocation, name, responsible, plannedEndDate;

  final Color? importanceLevelColor;
  final VoidCallback? press;
  final bool isIcon, isButtonVisible;
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
    this.isButtonVisible = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        onPressed(code.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: APPColors.Main.grey,
          shadowColor: APPColors.Main.grey,
          elevation: 5.0,
          child: Container(
            width: context.width / 1.2,
            decoration: WoListCardDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  codeAndStatusWidget(context),
                  Divider(height: 10),
                  woListText(serviceName),
                  woListText(name),
                  NullCheckWidget().nullCheckWidget(
                      moduleLocation,
                      Text(
                        'Mahal Bilgisi Bulunmuyor',
                        style: TextStyle(color: APPColors.Main.red),
                      ),
                      woListText(moduleLocation)),
                  isButtonVisible ?    
                  Center(
                    child: CustomHalfButtons(leftTitle: Text('Reddet',style: TextStyle(color: APPColors.Main.white),), leftOnPressed: (){},rightTitle: Text('Onayla',style: TextStyle(color: APPColors.Main.white),),rightOnPressed: (){},)) 
                  : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Flexible codeAndStatusWidget(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: context.width / 1.2,
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
}
