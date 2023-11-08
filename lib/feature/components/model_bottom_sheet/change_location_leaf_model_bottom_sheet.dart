import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/leaf_location_provider.dart';

import '../../extensions/context_extension.dart';

class ChangeLocationLeafModelBottomSheet extends StatelessWidget {
  const ChangeLocationLeafModelBottomSheet({super.key, required this.rootTitle});

  final String rootTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: context.height * 0.8,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: ChangeNotifierProvider(
            create: (_) => LeafLocationProvider(),
            child: Consumer<LeafLocationProvider>(
              builder: (context, value, child) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  value.getMainStructure();
                });
                return value.isLoading
                    ? Center(child: CircularProgressIndicator(color: APPColors.Main.blue))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            TreeView(
                              data: [value.root],
                              lazy: true,
                              load: value.load,
                              showCheckBox: true,
                              showFilter: true,
                              onCheck: (checked, node) async {
                                if (checked == true) {
                                  final response = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          LocaleKeys.ChangeLocale.tr(),
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        content: Flexible(
                                          flex: 2,
                                          child: Text(
                                            '${LocaleKeys.ChangeLocaleText.tr()} ${node.title}',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            overflow: TextOverflow.visible,
                                            maxLines: 10,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: Text(
                                              LocaleKeys.Cancel.tr(),
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            child: Text(
                                              LocaleKeys.Approve.tr(),
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  if (response == false || response == null) {
                                    checked = false;
                                  } else if (response == true) {
                                    // update location
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
