import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

class ScopeBottomSheet extends StatelessWidget {
  const ScopeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ScopeProvider(),
        child: Consumer<ScopeProvider>(builder: (context, ScopeProvider provider, child) {
          if (provider.fetchQuery) {
            provider.getQuery();
          }
          return Text('dadadadadadadadadad');
        }));
  }
}
