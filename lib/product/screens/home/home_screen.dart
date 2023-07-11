import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/cards/custom_issue_detail_card.dart';

//s
@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: DetailListWidget(
            respondedDate: '20240202124212',
            fixedDate: '20240102124212',
            fixTimer: '20240502124212',
            respondedTimer: '20240702124212',
            targetFDate: '20240702124212',
            targetRDate: '',
            onPressed: () {},
          )),
        ],
      ),
    );
  }
}
