import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_field_date_picker.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input_underline.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';

class AddEffortsModalBottomSheet extends StatelessWidget {
  const AddEffortsModalBottomSheet({
    super.key,
    required this.checkListValueId,
    required this.selectedStartDate,
    required this.selectedEndtDate,
    required this.selectedEffortDuration,
    required this.selectedEffortType,
    required this.selectedDescription,
    required this.provider,
  });
  final int checkListValueId;
  final Function selectedStartDate;
  final Function selectedEndtDate;
  final Function selectedEffortDuration;
  final Function selectedEffortType;
  final Function selectedDescription;
  final ScopeProvider provider;

  @override
  Widget build(BuildContext context) => _bodyWidget(context);

  Widget _bodyWidget(BuildContext context) {
    return GraphQLProvider(
        client: GraphQLManager.getClientForMutation(context),
        child: Mutation(
            options: MutationOptions(
              document: gql(MaintenancesTaskQuery.submitChecklistValueEffort),
              update: (GraphQLDataProxy cache, QueryResult? result) {},
              onCompleted: (dynamic resultData) async {
                //context.router.push(ScopeDetail(maintanenceList: maintanenceModel, checkListValueModel: startCheckListValue));
              },
            ),
            builder: (RunMutation runMutation, QueryResult? result) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: context.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 80,
                          child: _Inputs(
                            selectedStartDate: selectedStartDate,
                            selectedEndDate: selectedEndtDate,
                            selectedEffortDuration: selectedEffortDuration,
                            selectedEffortType: selectedEffortType,
                            selectedDescription: selectedDescription,
                          ),
                        ),
                        Expanded(
                            flex: 20,
                            child: _InputButton(onPressed: () {
                              runMutation(
                                MaintenancesTaskVariableQueries.submitChecklistValueEffortInput(checkListValueId, provider.startDate,
                                    provider.endEffortDate, provider.effortDuration, provider.effortType, provider.effortDescription),
                              );
                            })),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

class _InputButton extends StatelessWidget {
  const _InputButton({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomHalfButtons(
      leftTitle: const Text(LocaleKeys.Cancel).tr(),
      rightTitle: const Text(LocaleKeys.Approve).tr(),
      leftOnPressed: () => Navigator.pop(context),
      rightOnPressed: () => {
        onPressed(),
      },
    );
  }
}

class _Inputs extends StatefulWidget {
  const _Inputs({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.selectedEffortDuration,
    required this.selectedEffortType,
    required this.selectedDescription,
  });

  final Function selectedStartDate;
  final Function selectedEndDate;
  final Function selectedEffortDuration;
  final Function selectedEffortType;
  final Function selectedDescription;

  @override
  State<_Inputs> createState() => _InputsState();
}

class _InputsState extends State<_Inputs> {
  final TextEditingController _initialController = TextEditingController();
  int _hour = 0;
  int _minute = 0;

  void setInitialController(String value) => setState(() {
        _initialController.text = value;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: LocaleKeys.StartDate.tr(),
            onTap: (value) => widget.selectedStartDate(value),
            initialDate: DateTime(2015),
            initialControllerFunction: setInitialController,
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: LocaleKeys.EndDate.tr(),
            onTap: (value) => widget.selectedEndDate(value),
            initialDate: _initialController.text.isEmpty ? DateTime.now() : DateTime.parse(_initialController.text),
          ),
        ),
        SizedBox(height: context.height * 0.02),
        Expanded(
          flex: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(LocaleKeys.Hour.tr()),
                  NumberPicker(
                    minValue: 0,
                    maxValue: 999,
                    value: _hour,
                    onChanged: (val) {
                      setState(() {
                        _hour = val;
                      });
                      _setEffortDuration();
                    },
                  ),
                ],
              ),
              const SizedBox(width: 25),
              Column(
                children: [
                  Text(LocaleKeys.Minute.tr()),
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: _minute,
                    onChanged: (val) {
                      setState(() {
                        _minute = val;
                      });
                      _setEffortDuration();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: context.height * 0.02),
        Expanded(
          flex: 8,
          child: DropDownInputFields(
            labelText: LocaleKeys.EffortType.tr(),
            onChangedFunction: (value) => widget.selectedEffortType(value),
            rightIcon: Icons.arrow_downward,
            dropDownArray: [LocaleKeys.Way.tr(), LocaleKeys.Work.tr()],
          ),
        ),
        Expanded(
          flex: 8,
          child: TextFieldsInputUnderline(
            hintText: LocaleKeys.EnterDescription.tr(),
            onChanged: (value) => widget.selectedDescription(value),
          ),
        )
      ],
    );
  }

  void _setEffortDuration() {
    String formattedMinute = _minute < 10 ? '0$_minute' : '$_minute';
    String formattedHour = _hour < 10 ? '0$_hour' : '$_hour';
    widget.selectedEffortDuration('$formattedHour:$formattedMinute');
  }
}
