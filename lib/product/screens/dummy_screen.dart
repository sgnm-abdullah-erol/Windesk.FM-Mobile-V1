import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/route/app_route.gr.dart';
import '../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import '../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

@RoutePage()
class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  @override
  void initState() {
    WorkOrderServiceRepository x = WorkOrderServiceRepositoryImpl();

    x.getWorkOrderDateAction('wo00002989', 'end');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //push to DummyScreenTwo with auto router
            context.router.push(const DummyScreenTwo());
          },
          child: const Text('Dummy Screen'),
        ),
      ),
    );
  }
}
