import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/snackbar/snackbar.dart';

//s
@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    test() {
      print('asd');
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ElevatedButton(
            onPressed: () {
              snackBar(context, 'test', 'success');
            },
            child: Text('asd')));
  }
}
