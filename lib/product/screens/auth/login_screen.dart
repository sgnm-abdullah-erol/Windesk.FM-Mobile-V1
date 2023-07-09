import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/route/app_route.gr.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(const AppWrapper());
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
