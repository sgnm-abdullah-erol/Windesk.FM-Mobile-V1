import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/route/app_route.gr.dart';

import '../../../../../../feature/components/buttons/custom_elevated_button_with_icon.dart';
import '../../detail_work_order/provider/work_order_detail_provider.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';

@RoutePage()
class SearchWorkOrderScreen extends StatefulWidget {
  const SearchWorkOrderScreen({super.key});

  @override
  State<SearchWorkOrderScreen> createState() => _SearchWorkOrderScreenState();
}

class _SearchWorkOrderScreenState extends State<SearchWorkOrderScreen> {
  late String _woNumber;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WorkOrderDetailProvider(),
        child: Consumer<WorkOrderDetailProvider>(builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          context.read<WorkOrderDetailProvider>().isSuccess
              ? context.router.push(DetailWorkOrderScreen(workSpaceDetail: context.read<WorkOrderDetailProvider>().woDetailList!))
              : null;
          return Scaffold(
            appBar: AppBar(),
            body: context.read<WorkOrderDetailProvider>().isLoading
                ? const CustomLoadingIndicator()
                : Center(
                    child: Padding(
                      padding: CustomPaddings.pageNormal,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (String change) {
                              setState(() {
                                _woNumber = change;
                              });
                            },
                            maxLength: 20,
                            style: TextStyle(color: APPColors.Main.black),
                            decoration: const InputDecoration(label: Text('WO Number'), border: OutlineInputBorder(), prefixIcon: Icon(Icons.work)),
                            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  height: 10,
                                  width: 10.0 * currentLength!,
                                  color: Colors.green[100],
                                ),
                              );
                            },
                          ),
                          CustomElevatedButtonWithIcon(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 20,
                            bgColor: APPColors.Modal.blue,
                            textValue: 'Ara',
                            textColor: APPColors.Main.white,
                            icon: Icons.send,
                            iconColor: APPColors.Main.white,
                            onPressFunction: () {
                              context.read<WorkOrderDetailProvider>().getWorkOrderWithSearch(_woNumber);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
          );
        }));
  }
}
