import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';

class CustomTracingList extends StatelessWidget {
  const CustomTracingList({super.key, required this.title, required this.count, required this.code});

  final String title;
  final String count;
  final String code;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: Container(
            height: context.height / 16,
            decoration: BoxDecoration(
              color: APPColors.Main.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: APPColors.Main.grey, blurRadius: 2, offset: const Offset(0, 2))],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_title(), _count()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _title() {
    return Expanded(
      flex: 8,
      child: Text(
        title.toString(),
        maxLines: 1,
        style: TextStyle(fontSize: 15, color: count == '0' ? APPColors.Main.grey : APPColors.Main.black),
      ),
    );
  }

  Expanded _count() {
    return Expanded(
      flex: 3,
      child: Text(
        count,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 22, color: APPColors.TracingNumber.blue),
      ),
    );
  }
}
