import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/dynamic_form/dynamic_form.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import '../../../product/screens/home/screens/work_order_scope/queries/scope/maintenances_task.dart' as queries;

class CustomScopeCheckItemCard extends StatefulWidget {
  const CustomScopeCheckItemCard({super.key, this.checkItem, required this.provider});

  final IncludesOfCheckItemModel? checkItem;
  final ScopeProvider provider;

  @override
  State<CustomScopeCheckItemCard> createState() => _CustomScopeCheckItemCardState();
}

class _CustomScopeCheckItemCardState extends State<CustomScopeCheckItemCard> {
  final TextEditingController _initialController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _numberEditingController = TextEditingController();
  bool selectedValue = false;
  void setInitialController(String value) => setState(() {
        _initialController.text = value;
      });
  String token = '';

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: GraphQLManager.getClientForMutation(context),
        child: Mutation(
            options: MutationOptions(
              document: gql(queries.createCheckItemValue), // this is the mutation string you just created
              // you can update the cache based on results
              // or do something with the result.data on completion
              update: (GraphQLDataProxy cache, QueryResult? result) {
                print(result ?? '' + ' ' + cache.toString());
                return cache;
              },
              onCompleted: (dynamic resultData) {
                print('response');
                print(resultData);
                //print('resultdataaaaa' + resultData);
              },
            ),
            builder: (
              RunMutation runMutation,
              QueryResult? result,
            ) {
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
                          }, (String value) => widget.provider.selectedDate(value), (String value) => setInitialController(value),
                              _textEditingController, _numberEditingController),
                        ),
                        ElevatedButton(
                          onPressed: () => runMutation({
                            "createCheckItemValueInput": {"checkItemId": 1805, "checkListValueId": 1918, "inputValue": null}
                          }),
                          child: Text('Create User'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
