import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/scope/maintenances_task.dart' as queries;

class ScopeProvider extends ChangeNotifier {
  bool _fetchQuery = true;
  bool get fetchQuery => _fetchQuery;

  bool _selectedValue = false;
  bool get selectedValue => _selectedValue;

  void setSelectedValue() {
    _selectedValue = !_selectedValue;
    print(_selectedValue);
    notifyListeners();
  }

  void getQuery() async {
    _fetchQuery = false;
    notifyListeners();

    final response = useQuery(
      QueryOptions(
        document: gql(queries.maintenancesTask),
        variables: const {
          "maintenanceTypeWhere2": {"language": "en"},
          "prioritiyWhere2": {"language": "en"},
          "where": {"id": 2940}
        },
        pollInterval: const Duration(seconds: 10),
      ),
    );
    notifyListeners();
  }
}
