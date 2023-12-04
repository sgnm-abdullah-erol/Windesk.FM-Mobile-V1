import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/dynamic_form/dynamic_form.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/mixin/custom_scope_check_item_card_mixin.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';

class CustomScopeCheckItemCard extends StatefulWidget {
  const CustomScopeCheckItemCard({super.key, this.checkItem, required this.provider, this.checkListValueId});

  final IncludesOfCheckItemModel? checkItem;
  final ScopeProvider provider;
  final int? checkListValueId;

  @override
  State<CustomScopeCheckItemCard> createState() => _CustomScopeCheckItemCardState();
}

class _CustomScopeCheckItemCardState extends State<CustomScopeCheckItemCard> with CustomScopeCheckItemCardMixin {
  void _setInitialController(String value) => setState(() => initialController.text = value);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClientForMutation(context),
      child: Mutation(
        options: MutationOptions(
          document: gql(MaintenancesTaskQuery.createCheckItemValue),
          update: (GraphQLDataProxy cache, QueryResult? result) {},
          onCompleted: (dynamic resultData) => completedMutationAction(context, resultData),
        ),
        builder: (RunMutation runMutation, QueryResult? result) => _body(context, runMutation),
      ),
    );
  }

  Padding _body(BuildContext context, RunMutation<dynamic> runMutation) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: APPColors.Main.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: APPColors.Main.grey, blurRadius: 15, offset: const Offset(0, 4), spreadRadius: 2)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(widget.checkItem?.name ?? '', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              Text(widget.checkItem?.description ?? '', style: Theme.of(context).textTheme.bodySmall),
              _dynamicForm(),
              _saveButton(runMutation),
              _addDocumentButton(runMutation, context)
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _addDocumentButton(RunMutation<dynamic> runMutation, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() => isDocumentMutation = true);
        runMutation(MaintenancesTaskVariableQueries.createCheckItemValueInput(widget.checkItem?.id ?? 0, widget.checkListValueId ?? 0, null));
      },
      child: Text(
        LocaleKeys.AddedDocumants.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: APPColors.Main.blue),
      ),
    );
  }

  ElevatedButton _saveButton(RunMutation<dynamic> runMutation) {
    return ElevatedButton(
      onPressed: () {
        String? inputValue = widget.checkItem?.inputType == FormTypes.BOOLYES
            ? selectedValue.toString()
            : widget.checkItem?.inputType == FormTypes.TEXT
                ? textEditingController.text
                : widget.checkItem?.inputType == FormTypes.NUMBER
                    ? numberEditingController.text
                    : initialController.text;

        MaintenancesTaskVariableQueries.createCheckItemValueInput(widget.checkItem?.id ?? 0, widget.checkListValueId ?? 0, inputValue);
      },
      child: Text(LocaleKeys.Save.tr(), style: TextStyle(color: APPColors.Main.blue)),
    );
  }

  Align _dynamicForm() {
    return Align(
      alignment: Alignment.center,
      child: DynamicForm().formType(
        widget.checkItem?.inputType ?? '',
        selectedValue,
        () => setState(() => selectedValue = !selectedValue),
        (String value) => widget.provider.selectedDate(value),
        (String value) => _setInitialController(value),
        textEditingController,
        numberEditingController,
      ),
    );
  }
}
