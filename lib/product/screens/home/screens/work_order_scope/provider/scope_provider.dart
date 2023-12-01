import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';

class ScopeProvider extends ChangeNotifier {
  bool _fetchQuery = true;
  bool get fetchQuery => _fetchQuery;

  bool _selectedValue = false;
  bool get selectedValue => _selectedValue;

  IncludesOfCheckItemModel _checkItem = const IncludesOfCheckItemModel();
  IncludesOfCheckItemModel get checkItem => _checkItem;

  void setSelectedValue(IncludesOfCheckItemModel? checkItems) {
    if (checkItems?.value) {
      //checkItems?.value = !checkItems.value;
    }
    _selectedValue = !_selectedValue;
    notifyListeners();
  }

  void getQuery() async {
    _fetchQuery = false;
    notifyListeners();
    // final response = useQuery(
    //   QueryOptions(
    //     document: gql(queries.maintenancesTask),
    //     variables: const {
    //       "maintenanceTypeWhere2": {"language": "en"},
    //       "prioritiyWhere2": {"language": "en"},
    //       "where": {"id": 2940}
    //     },
    //     pollInterval: const Duration(seconds: 10),
    //   ),
    // );
    notifyListeners();
  }
}
