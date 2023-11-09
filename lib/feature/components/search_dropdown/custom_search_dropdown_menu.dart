import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';

class CustomSearchDropDownMenu extends StatelessWidget {
  const CustomSearchDropDownMenu({super.key, required this.list, required this.labelText, required this.onChanged, required this.error});

  final List<String> list;
  final String labelText;
  final String error;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        searchDelay: const Duration(milliseconds: 0),
        showSearchBox: true,
        showSelectedItems: true,
        listViewProps: const ListViewProps(scrollDirection: Axis.vertical, shrinkWrap: true),
        itemBuilder: (BuildContext context, String item, bool isSelected) {
          return ListTile(
            title: Text(
              item,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isSelected ? APPColors.Main.red : APPColors.Main.black),
            ),
          );
        },
        emptyBuilder: (BuildContext context, String item) {
          return ListTile(
            title: Text(error, style: Theme.of(context).textTheme.bodyMedium),
          );
        },
      ),
      items: list,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.left,
        dropdownSearchDecoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodySmall,
          labelText: labelText,
        ),
      ),
      onChanged: (String? val) {
        if (val != null) onChanged(val);
      },
    );
  }
}
