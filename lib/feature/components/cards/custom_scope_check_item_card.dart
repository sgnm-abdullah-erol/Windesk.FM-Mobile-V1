import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/dynamic_form/dynamic_form.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import '../../../product/screens/home/screens/work_order_scope/queries/scope/maintenances_task.dart' as queries;

class CustomScopeCheckItemCard extends StatefulWidget {
  const CustomScopeCheckItemCard({super.key, this.checkItem, required this.provider, this.checkListValueId});

  final IncludesOfCheckItemModel? checkItem;
  final ScopeProvider provider;
  final int? checkListValueId;

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
            update: (GraphQLDataProxy cache, QueryResult? result) {},
            onCompleted: (dynamic resultData) {
              if (resultData['createCheckItemValue']['id'] != null) {
                snackBar(context, 'İşlem başarılı', 'success');
              } else {
                snackBar(context, 'İşlem başarısız', 'error');
              }
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
                          "createCheckItemValueInput": {
                            "checkItemId": widget.checkItem?.id,
                            "checkListValueId": widget.checkListValueId,
                            "inputValue": widget.checkItem?.inputType == 'BOOLYES'
                                ? selectedValue
                                : widget.checkItem?.inputType == 'TEXT'
                                    ? _textEditingController.text
                                    : widget.checkItem?.inputType == 'NUMBER'
                                        ? _numberEditingController.text
                                        : _initialController.text
                          }
                        }),
                        child: const Text('Kaydet'),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
