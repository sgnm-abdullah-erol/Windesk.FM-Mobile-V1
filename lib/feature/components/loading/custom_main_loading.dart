import 'package:flutter/material.dart';

class CustomMainLoading extends StatelessWidget {
  const CustomMainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
