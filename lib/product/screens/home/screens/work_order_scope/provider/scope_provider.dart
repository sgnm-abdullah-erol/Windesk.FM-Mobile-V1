import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

class ScopeProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _fetchQuery = true;
  bool get fetchQuery => _fetchQuery;

  bool _selectedValue = false;
  bool get selectedValue => _selectedValue;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final bool _dialVisible = false;
  bool get dialVisible => _dialVisible;

  bool _isImageAdded = false;
  bool get isImageAdded => _isImageAdded;

  bool _userClickedDocumants = false;
  bool get userClickedDocumants => _userClickedDocumants;

  String _startDate = '';
  String get startDate => _startDate;

  final String _userToken = '';
  String get userToken => _userToken;

  final IncludesOfCheckItemModel _checkItem = const IncludesOfCheckItemModel();
  IncludesOfCheckItemModel get checkItem => _checkItem;

  bool fetchToken = true;

  void setStateToBeginning() {
    _userClickedDocumants = false;
  }

  void userClickedDocumantsFunction() => _userClickedDocumants = true;

  String _startEffortDate = '';
  String get startEffortDate => _startEffortDate;

  String _endEffortDate = '';
  String get endEffortDate => _endEffortDate;

  String _effortDuration = '';
  String get effortDuration => _effortDuration;

  String _effortType = '';
  String get effortType => _effortType;

  String _effortDescription = '';
  String get effortDescription => _effortDescription;

  void setEffortDescription(String value) => _effortDescription = value;
  void setEffortType(String value) => _effortType = value;
  void setEffortDuration(String value) => _effortDuration = value;

  void setStartEffortDate(String value) {
    _startEffortDate = value;
  }

  void setEndEffortDate(String value) => _endEffortDate = value;

  void addEffort(){

  }

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

  void saveImage(BuildContext context, String imagePath, String desc, String scopeId, String taskKey) async {
    if (imagePath.isEmpty) {
      snackBar(context, LocaleKeys.EmptyImagePath.tr(), 'error');
      return;
    }
    _isLoading = true;
    notifyListeners();

    final String token = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.saveDocumentForMaintenance(imagePath, '', desc, token, scopeId, taskKey, 'image');
    response.fold(
      (l) => {
        l
            ? {
                _isImageAdded = true,
              }
            : {
                _isImageAdded = false,
              }
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isImageAdded = false;
    });
  }

  void savePdf(BuildContext context, String imagePath, String desc, String scopeId, String taskKey) async {
    if (imagePath.isEmpty) {
      snackBar(context, LocaleKeys.EmptyImagePath.tr(), 'error');
      return;
    }
    _isLoading = true;
    notifyListeners();

    final String token = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.saveDocumentForMaintenance(imagePath, '', desc, token, scopeId, taskKey, 'image');
    response.fold(
      (l) => {
        l
            ? {
                _isImageAdded = true,
              }
            : {
                _isImageAdded = false,
              }
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isImageAdded = false;
    });
  }
}
