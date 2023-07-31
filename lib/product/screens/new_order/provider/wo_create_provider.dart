// ignore_for_file: unused_element, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedby_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_type_model.dart';
import 'package:vm_fm_4/product/screens/new_order/service/wo_create_service_repository_impl.dart';

class WoCreateProvider extends ChangeNotifier {
  final WoCreateServiceRepositoryImpl _woCreateServiceRepository = Injection.getIt.get<WoCreateServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _locationLeaf = true;
  bool get locationLeaf => _locationLeaf;

  bool _buildingLeaf = true;
  bool get buildingLeaf => _buildingLeaf;

  bool _floorLeaf = true;
  bool get floorLeaf => _floorLeaf;

  String _summary = '';
  String get summary => _summary;

  String _requestedBy = '';
  String get requestedBy => _requestedBy;

  String _type = '';
  String get type => _type;

  String _location = '';
  String get location => _location;

  String _block = '';
  String get block => _block;

  String _floor = '';
  String get floor => _floor;

  String _space = '';
  String get space => _space;

  String _requestType = '';
  String get requestType => _requestType;

  String _locationKey = '';

  String _buildKey = '';

  String _floorKey = '';

  String _lazyType = '';

  bool _locationLoading = true;
  bool get locationLoading => _locationLoading;

  bool _requestedLoading = true;
  bool get requestedLoading => _requestedLoading;

  bool _typeLoading = true;
  bool get typeLoading => _typeLoading;

  bool _requestedTypeLoading = true;
  bool get requestedTypeLoading => _requestedTypeLoading;

  bool _lazyLoading = true;
  bool get lazyLoading => _locationLoading;

  WoCreateLocationModel _woLocationList = const WoCreateLocationModel();
  WoCreateLocationModel get woLocationList => _woLocationList;

  List<WoCreateRequestedByModel> _getRequestedBy = [];
  List<WoCreateRequestedByModel> get getRequestedBy => _getRequestedBy;

  List<WoCreateTypeModel> _getTypes = [];
  List<WoCreateTypeModel> get getTypes => _getTypes;

  WoCreateLeafModel _woBlockList = const WoCreateLeafModel();
  WoCreateLeafModel get woBlockList => _woBlockList;

  WoCreateLeafModel _woFloorList = const WoCreateLeafModel();
  WoCreateLeafModel get woFloorList => _woFloorList;

  WoCreateLeafModel _woSpaceList = const WoCreateLeafModel();
  WoCreateLeafModel get woSpaceList => _woSpaceList;

  final List<String> _woLocationListChildren = [];
  List<String> get woLocationListChildren => _woLocationListChildren;

  final List<String> _woBlockListChildren = [];
  List<String> get woBlockListChildren => _woBlockListChildren;

  final List<String> _woFloorListChildren = [];
  List<String> get woFloorListChildren => _woFloorListChildren;

  final List<String> _woSpaceListChildren = [];
  List<String> get woSpaceListChildren => _woSpaceListChildren;

  final List<String> _getRequestedByChildren = [];
  List<String> get getRequestedByChildren => _getRequestedByChildren;

  final List<String> _getTypesChildren = [];
  List<String> get getTypesChildren => _getTypesChildren;

  void setSummary(String newValue) {
    _summary = newValue;
  }

  void setRequestedBy(String newValue) {
    _requestedBy = newValue;
  }

  void setType(String newValue) {
    _type = newValue;
  }

  void setLocation(String newValue) {
    woBlockListChildren.clear();
    woFloorListChildren.clear();
    _location = newValue;
    for (var i = 0; i < (_woLocationList.children?.length ?? 0); i++) {
      if (_woLocationList.children?[i].name == newValue) {
        _locationKey = _woLocationList.children?[i].key ?? '';
        _lazyType = _woLocationList.children?[i].labels?[0] ?? '';
        _locationLeaf = _woLocationList.children?[i].leaf ?? true;
      }
    }
    lazyList(_locationKey, _lazyType);
    notifyListeners();
  }

  void setBlock(String newValue) {
    woFloorListChildren.clear();
    _block = newValue;
    for (var i = 0; i < (_woBlockList.children?.length ?? 0); i++) {
      if (_woBlockList.children?[i].name == newValue) {
        _buildKey = _woBlockList.children?[i].key ?? '';
        _lazyType = _woBlockList.children?[i].labels?[0] ?? '';
        _buildingLeaf = _woBlockList.children?[i].leaf ?? true;
      }
    }
    lazyList(_buildKey, _lazyType);
    notifyListeners();
  }

  void setFloor(String newValue) {
    _floor = newValue;
    for (var i = 0; i < (_woFloorList.children?.length ?? 0); i++) {
      if (_woFloorList.children?[i].name == newValue) {
        _floorKey = _woFloorList.children?[i].key ?? '';
        _lazyType = _woFloorList.children?[i].labels?[0] ?? '';
        _floorLeaf = _woFloorList.children?[i].leaf ?? true;
      }
    }
    lazyList(_buildKey, _lazyType);
    notifyListeners();
  }

  void setSpace(String newValue) {
    _space = newValue;
    for (var i = 0; i < (_woFloorList.children?.length ?? 0); i++) {
      if (_woFloorList.children?[i].name == newValue) {
        _floorKey = _woFloorList.children?[i].key ?? '';
        _lazyType = _woFloorList.children?[i].labels?[0] ?? '';
      }
    }
    lazyList(_buildKey, _lazyType);
    notifyListeners();
  }

  void setrequestType(String newValue) {
    _requestType = newValue;
    notifyListeners();
  }

  void getLocation() async {
    _isLoading = true;
    //final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.getLocation(
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTE2NDg5MTcsImlhdCI6MTY5MDc4NDkxNywianRpIjoiNTdiMDIwMDUtYzFkNy00ZWM1LTk0ZDAtMTNkNjZmMmY0ZWM0IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5IiwiZW1haWwiOiJpc21ldC5hdGFtZXJAc2lnbnVtdHRlLmNvbSJ9.cOfqic4cHH5wbSTPo5LCmaMyr-B_GfaYZr7M8OtZq7JT8h1wZ_MMVw7lP-TBLKXgDL1pJw_ZOWoolndUWZDyPIbPjTqvnXldO3diBo7S1nLz2nYMhzNNWJFL3NvI2ETvgUcZGnlIPTdJAs3kCyRX41YjbpcXRTVRPanOcnV1MWnBXgmMMnrphKn9PlpLM46QasITGnTjtmz52JKKRSskFz2yiLBJKYVdKw54KEbcjos2Rg-8Sv71j6bqhn_dkrLzHnqM0heO8c6JFzuEf0HCk3_K8uOyOJL4iHGoNXvfrul4V5O0GuJdTCWfjPyesHwesFp4K3Zn0jxPtPLqQi3T3g');
    _locationLoading = false;
    notifyListeners();
    _woLocationListChildren.clear();

    response.fold(
      (l) => {
        _woLocationList = l,
        for (var i = 0; i < (_woLocationList.children?.length ?? 0); i++)
          {
            _woLocationListChildren.add(_woLocationList.children?[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    _isLoading = false;
    notifyListeners();
  }

  void lazyList(String key, String lazyType) async {
    //final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.getLazyLoading(
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTE2NDg5MTcsImlhdCI6MTY5MDc4NDkxNywianRpIjoiNTdiMDIwMDUtYzFkNy00ZWM1LTk0ZDAtMTNkNjZmMmY0ZWM0IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5IiwiZW1haWwiOiJpc21ldC5hdGFtZXJAc2lnbnVtdHRlLmNvbSJ9.cOfqic4cHH5wbSTPo5LCmaMyr-B_GfaYZr7M8OtZq7JT8h1wZ_MMVw7lP-TBLKXgDL1pJw_ZOWoolndUWZDyPIbPjTqvnXldO3diBo7S1nLz2nYMhzNNWJFL3NvI2ETvgUcZGnlIPTdJAs3kCyRX41YjbpcXRTVRPanOcnV1MWnBXgmMMnrphKn9PlpLM46QasITGnTjtmz52JKKRSskFz2yiLBJKYVdKw54KEbcjos2Rg-8Sv71j6bqhn_dkrLzHnqM0heO8c6JFzuEf0HCk3_K8uOyOJL4iHGoNXvfrul4V5O0GuJdTCWfjPyesHwesFp4K3Zn0jxPtPLqQi3T3g',
        key);
    _lazyLoading = false;
    notifyListeners();

    if (lazyType == 'Building') {
      woBlockListChildren.clear();
      response.fold(
        (l) => {
          _woBlockList = l,
          for (var i = 0; i < (_woBlockList.children?.length ?? 0); i++)
            {
              _woBlockListChildren.add(_woBlockList.children?[i].name ?? ''),
            }
        },
        (r) => {},
      );
    } else if (lazyType == 'Block') {
      woFloorListChildren.clear();
      response.fold(
        (l) => {
          _woFloorList = l,
          for (var i = 0; i < (_woFloorList.children?.length ?? 0); i++)
            {
              _woFloorListChildren.add(_woFloorList.children?[i].name ?? ''),
            }
        },
        (r) => {},
      );
    } else if (lazyType == 'Floor') {
      response.fold(
        (l) => {
          _woSpaceList = l,
          for (var i = 0; i < (_woSpaceList.children?.length ?? 0); i++)
            {
              _woSpaceListChildren.add(_woSpaceList.children?[i].name ?? ''),
            }
        },
        (r) => {},
      );
    }
    notifyListeners();
  }

  void getRequestedByPro() async {
    _isLoading = true;
    final response = await _woCreateServiceRepository.getRequestedBy(
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTE2NDg5MTcsImlhdCI6MTY5MDc4NDkxNywianRpIjoiNTdiMDIwMDUtYzFkNy00ZWM1LTk0ZDAtMTNkNjZmMmY0ZWM0IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5IiwiZW1haWwiOiJpc21ldC5hdGFtZXJAc2lnbnVtdHRlLmNvbSJ9.cOfqic4cHH5wbSTPo5LCmaMyr-B_GfaYZr7M8OtZq7JT8h1wZ_MMVw7lP-TBLKXgDL1pJw_ZOWoolndUWZDyPIbPjTqvnXldO3diBo7S1nLz2nYMhzNNWJFL3NvI2ETvgUcZGnlIPTdJAs3kCyRX41YjbpcXRTVRPanOcnV1MWnBXgmMMnrphKn9PlpLM46QasITGnTjtmz52JKKRSskFz2yiLBJKYVdKw54KEbcjos2Rg-8Sv71j6bqhn_dkrLzHnqM0heO8c6JFzuEf0HCk3_K8uOyOJL4iHGoNXvfrul4V5O0GuJdTCWfjPyesHwesFp4K3Zn0jxPtPLqQi3T3g');
    _requestedLoading = false;

    _getRequestedByChildren.clear();
    notifyListeners();
    response.fold(
      (l) => {
        _getRequestedBy = l,
        for (var i = 0; i < (_getRequestedBy.length); i++)
          {
            _getRequestedByChildren.add(_getRequestedBy[i].username ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    _isLoading = false;
    notifyListeners();
  }

  void getType() async {
    final response = await _woCreateServiceRepository.getType(
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTE2NDg5MTcsImlhdCI6MTY5MDc4NDkxNywianRpIjoiNTdiMDIwMDUtYzFkNy00ZWM1LTk0ZDAtMTNkNjZmMmY0ZWM0IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5IiwiZW1haWwiOiJpc21ldC5hdGFtZXJAc2lnbnVtdHRlLmNvbSJ9.cOfqic4cHH5wbSTPo5LCmaMyr-B_GfaYZr7M8OtZq7JT8h1wZ_MMVw7lP-TBLKXgDL1pJw_ZOWoolndUWZDyPIbPjTqvnXldO3diBo7S1nLz2nYMhzNNWJFL3NvI2ETvgUcZGnlIPTdJAs3kCyRX41YjbpcXRTVRPanOcnV1MWnBXgmMMnrphKn9PlpLM46QasITGnTjtmz52JKKRSskFz2yiLBJKYVdKw54KEbcjos2Rg-8Sv71j6bqhn_dkrLzHnqM0heO8c6JFzuEf0HCk3_K8uOyOJL4iHGoNXvfrul4V5O0GuJdTCWfjPyesHwesFp4K3Zn0jxPtPLqQi3T3g');
    _typeLoading = false;
    _getTypesChildren.clear();
    notifyListeners();

    response.fold(
      (l) => {
        _getTypes = l,
        for (var i = 0; i < (_getTypes.length); i++)
          {
            _getTypesChildren.add(_getTypes[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    notifyListeners();
  }

  void getRequestedType() async {
    final response = await _woCreateServiceRepository.getRequestedType(
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTE2NDg5MTcsImlhdCI6MTY5MDc4NDkxNywianRpIjoiNTdiMDIwMDUtYzFkNy00ZWM1LTk0ZDAtMTNkNjZmMmY0ZWM0IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI4ZTgwYzExMC02NTdiLTQxYjItOTQzYy1lNzNmZTdkZWVhODQiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5IiwiZW1haWwiOiJpc21ldC5hdGFtZXJAc2lnbnVtdHRlLmNvbSJ9.cOfqic4cHH5wbSTPo5LCmaMyr-B_GfaYZr7M8OtZq7JT8h1wZ_MMVw7lP-TBLKXgDL1pJw_ZOWoolndUWZDyPIbPjTqvnXldO3diBo7S1nLz2nYMhzNNWJFL3NvI2ETvgUcZGnlIPTdJAs3kCyRX41YjbpcXRTVRPanOcnV1MWnBXgmMMnrphKn9PlpLM46QasITGnTjtmz52JKKRSskFz2yiLBJKYVdKw54KEbcjos2Rg-8Sv71j6bqhn_dkrLzHnqM0heO8c6JFzuEf0HCk3_K8uOyOJL4iHGoNXvfrul4V5O0GuJdTCWfjPyesHwesFp4K3Zn0jxPtPLqQi3T3g');
    _requestedTypeLoading = false;
    notifyListeners();

    response.fold(
      (l) => {
        _getTypes = l,
        for (var i = 0; i < (_getTypes.length); i++)
          {
            _getTypesChildren.add(_getTypes[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    notifyListeners();
  }
}
