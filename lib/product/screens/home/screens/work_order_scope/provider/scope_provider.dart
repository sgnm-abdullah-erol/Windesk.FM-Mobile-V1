import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';

class ScopeProvider extends ChangeNotifier {
  bool _fetchQuery = true;
  bool get fetchQuery => _fetchQuery;

  bool _selectedValue = false;
  bool get selectedValue => _selectedValue;

  String _startDate = '';
  String get startDate => _startDate;

  final String _userToken = '';
  String get userToken => _userToken;

  final IncludesOfCheckItemModel _checkItem = const IncludesOfCheckItemModel();
  IncludesOfCheckItemModel get checkItem => _checkItem;

  bool fetchToken = true;

  // void getToken() async {
  //   fetchToken = false;
  //   String _userToken = await SharedManager().getString(SharedEnum.userToken);
  //   print('sdasddsads' + _userToken);
  //   final AuthLink authLink = AuthLink(
  //     getToken: () async => 'Bearer $_userToken',
  //     // OR
  //     // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  //   );
  // }

  void setSelectedValue(IncludesOfCheckItemModel? checkItems) {
    if (checkItems?.value) {
      //checkItems?.value = !checkItems.value;
    }
    _selectedValue = !_selectedValue;
    notifyListeners();
  }

  void selectedDate(String value) {
    _startDate = value;
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

  void saveCheckItemDocument(BuildContext context, String imagePath, String desc, String taskId, String taskKey) {
    print('imagePath : ${imagePath}desc : ${desc}taskId : ${taskId}taskKey : $taskKey');
  }
}
