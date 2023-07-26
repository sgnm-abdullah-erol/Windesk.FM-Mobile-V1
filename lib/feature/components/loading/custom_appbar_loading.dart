import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';

class CustomAppbarLoading extends StatelessWidget {
  const CustomAppbarLoading({super.key, required this.appBar});

  final PreferredSizeWidget appBar;
  final String _windesk = 'Windesk.';
  final String _fm = 'FM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(alignment: Alignment.center, child: CircularProgressIndicator(color: APPColors.Main.blue)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _windesk,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: APPColors.Main.blue,
                    ),
              ),
              const SizedBox(width: 10),
              AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText(
                    _fm,
                    textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: APPColors.Login.blue,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
