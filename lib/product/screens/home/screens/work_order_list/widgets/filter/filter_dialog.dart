import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/filter/filter_provider.dart';

class CustomFilterDialog extends StatelessWidget {
  const CustomFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: APPColors.Main.white,
      content: ChangeNotifierProvider(
        create: (_) => FilterProvider(),
        child: Consumer<FilterProvider>(
          builder: (context, provider, child) {
            provider.init();
            return provider.isLoading ? const _Loading() : _Body(provider);
          },
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 8,
      width: context.width / 12,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body(this.provider);

  final FilterProvider provider;

  final List<String> _dummySpace = ['space1', 'space2'];
  final List<String> _dummyCategory = ['category1', 'category2'];
  final List<String> _dummyPriority = ['priority1', 'priority2'];
  final List<String> _dummyState = ['status1', 'status2'];
  final List<String> _dummyDate = ['Azalan', 'Artan'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(LocaleKeys.Filter.tr(), style: Theme.of(context).textTheme.bodyMedium),
          const Divider(),
          DropDownInputFields(
            labelText: LocaleKeys.Space.tr(),
            onChangedFunction: provider.setSpace,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: _dummySpace,
          ),
          DropDownInputFields(
            labelText: LocaleKeys.Priority.tr(),
            onChangedFunction: provider.setPriority,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: _dummyPriority,
          ),
          DropDownInputFields(
            labelText: LocaleKeys.Date.tr(),
            onChangedFunction: provider.setDate,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: _dummyDate,
          ),
          DropDownInputFields(
            labelText: LocaleKeys.Category.tr(),
            onChangedFunction: provider.setCategory,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: _dummyCategory,
          ),
          DropDownInputFields(
            labelText: LocaleKeys.State.tr(),
            onChangedFunction: provider.setState,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: _dummyState,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () => Navigator.of(context).pop<bool>(false), child: Text(LocaleKeys.Cancel.tr())),
                  ElevatedButton(
                    onPressed: () {
                      // FILTRELEMEYI YAP
                    },
                    child: Text(LocaleKeys.Apply.tr()),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  provider.clearFilter();
                  // datayi ilk haliyle getir, filtreleme yapma, pop up
                },
                child: Text(LocaleKeys.Clear.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
