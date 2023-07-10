import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/cards/custom_issue_list_card.dart';

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
            child: CustomIssueListCard(
              code: 'asdasd',
              taskNo: 'sasdasdsad',
              description: 'sasdasdsad',
              sumdesc1: 'sasdasdsad',
              statusName: 'sasdasdsad',
              space: 'sasdasdsad',
              location: 'sasdasdsad',
              idate: 'sasdasdsad',
              statusCode: 'sasdasdsad',
              respondedIDate: '20220210151200',
              targetFDate: '20240212151200',
              targetRDate: '20220212151200',
              responseTimer: '0',
              fixedTimer: '1',
              onPressed: () {},
              onPressedLong: () {},
            ),
          ),
        ],
      ),
    );
  }
}
