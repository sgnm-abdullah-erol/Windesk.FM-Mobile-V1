import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

class AddDocumentsModalBottomSheet extends StatelessWidget {
  const AddDocumentsModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      width: context.width,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
