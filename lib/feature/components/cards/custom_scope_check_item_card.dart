import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/dynamic_form/dynamic_form.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import '../../../product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';

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
  bool isDocumentMutation = false;
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
            document: gql(MaintenancesTaskQuery.createCheckItemValue), // this is the mutation string you just created
            // you can update the cache based on results
            // or do something with the result.data on completion
            update: (GraphQLDataProxy cache, QueryResult? result) {},
            onCompleted: (dynamic resultData) {
              if (!isDocumentMutation) {
                if (resultData['createCheckItemValue']['id'] != null) {
                  snackBar(context, 'İşlem başarılı', 'success');
                } else {
                  snackBar(context, 'İşlem başarısız', 'error');
                }
              } else {
                setState(() {
                  isDocumentMutation = false;
                });
                ShowModalBottomSheet().show(
                  context,
                  AddImageModalBottomSheet(
                    taskId: resultData['createCheckItemValue']['id'].toString(),
                    taskKey: resultData['createCheckItemValue']['key'] ?? '',
                    saveImage: widget.provider.saveImage,
                  ),
                );
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
                        // TODO dynamic form
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
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isDocumentMutation = true;
                          });
                          runMutation({
                            "createCheckItemValueInput": {
                              "checkItemId": widget.checkItem?.id,
                              "checkListValueId": widget.checkListValueId,
                              "inputValue": null
                            }
                          });
                        },
                        child: const Text('Döküman Ekle'),
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
