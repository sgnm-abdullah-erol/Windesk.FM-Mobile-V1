import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/cards/custom_issue_list_card.dart';
import '../../../feature/components/cards/custom_tracing_list_card.dart';

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
              child: TaskListWidget(
            code: 'asdasd',
            taskNo: 'sasdasdsad',
            description: 'sasdasdsad',
            sumdesc1: 'sasdasdsad',
            statusName: 'sasdasdsad',
            space: 'sasdasdsad',
            location: 'sasdasdsad',
            idate: 'sasdasdsad',
            statusCode: 'sasdasdsad',
            targetFDate: '20240212151200',
            targetRDate: '20240212151200',
            // planedDate: 'sasdasdsad',
            // respondedIDate: 'sasdasdsad',
            // responseTimer: 'sasdasdsad',
            // fixedTimer: 'sasdasdsad',
            // fixedIDate: 'sasdasdsad',
            // timeInfoNow: 'sasdasdsad',
            onPressed: () {
              print('object');
            },
            onPressedLong: () {
              print('object');
            },
          )),
        ],
      ),
    );
  }
}
