import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/dynamic_form/dynamic_form.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

class CustomScopeCheckItemCard extends StatefulWidget {
  const CustomScopeCheckItemCard({super.key, this.checkItem, required this.provider});

  final IncludesOfCheckItemModel? checkItem;
  final ScopeProvider provider;

  @override
  State<CustomScopeCheckItemCard> createState() => _CustomScopeCheckItemCardState();
}

class _CustomScopeCheckItemCardState extends State<CustomScopeCheckItemCard> {
  @override
  bool selectedValue = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: APPColors.Main.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: APPColors.Main.grey, blurRadius: 2, offset: const Offset(0, 4))],
        ),
        child: Column(
          children: [
            Text(
              widget.checkItem?.name ?? '',
            ),
            Text(widget.checkItem?.description ?? ''),
            Align(
              alignment: Alignment.center,
              child: DynamicForm().formType(widget.checkItem?.inputType ?? '', selectedValue, () {
                setState(() {
                  selectedValue = !selectedValue;
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
