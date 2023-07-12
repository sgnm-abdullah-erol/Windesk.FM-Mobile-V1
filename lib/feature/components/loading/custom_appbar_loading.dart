import 'package:flutter/material.dart';

class CustomAppbarLoading extends StatelessWidget {
  const CustomAppbarLoading({super.key, required this.appBar});

  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
