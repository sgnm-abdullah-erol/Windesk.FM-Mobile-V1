// ignore_for_file: unused_element, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/database/shared_manager.dart';
import 'package:vm_fm_4/feature/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_component_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedby_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedtype_model.dart';
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

  bool _requestedTypeTree1 = true;
  bool get requestedTypeTree1 => _requestedTypeTree1;

  bool _isWorkOrderCreate = false;
  bool get isWorkOrderCreate => _isWorkOrderCreate;

  String _summary = '';
  String get summary => _summary;

  String _description = '';
  String get description => _description;

  String _requestedBy = '';
  String get requestedBy => _requestedBy;

  String _type = '';
  String get type => _type;

  String _category = '';
  String get category => _category;

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

  String _requestType1 = '';
  String get requestType1 => _requestType1;

  String _requestTypeKey = '';
  String get requestTypeKey => _requestTypeKey;

  String _requestedById = '';
  String get requestedById => _requestedById;

  String _woCategory = '';
  String get woCategory => _woCategory;

  String _component = '';
  String get component => _component;

  String _componentKey = '';
  String get componentKey => _componentKey;

  String _typesId = '';
  String get typesId => _typesId;

  String _requestedId = '';
  String get requestedId => _requestedId;

  String _requestedLabel = '';
  String get requestedLabel => _requestedLabel;

  String _date = '';
  String get date => _date;
  set setidate(String date1) {
    _date = date1;
    notifyListeners();
  }

  String _hour = '';
  String get hour => _hour;
  set setihour(String hour1) {
    _hour = hour1;
    notifyListeners();
  }

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

  bool _categoryLoading = true;
  bool get categoryLoading => _categoryLoading;

  bool _componentLoading = true;
  bool get componentLoading => _componentLoading;

  bool _lazyLoading = true;
  bool get lazyLoading => _locationLoading;

  WoCreateLocationModel _woLocationList = const WoCreateLocationModel();
  WoCreateLocationModel get woLocationList => _woLocationList;

  List<WoCreateRequestedByModel> _getRequestedBy = [];
  List<WoCreateRequestedByModel> get getRequestedBy => _getRequestedBy;

  List<WoCreateTypeModel> _getTypes = [];
  List<WoCreateTypeModel> get getTypes => _getTypes;

  List<WoCreateRequestedTypeModel> _getRequestedTypes = [];
  List<WoCreateRequestedTypeModel> get getRequestedTypes => _getRequestedTypes;

  List<WoCreateRequestedTypeModel> _getCategories = [];
  List<WoCreateRequestedTypeModel> get getCategories => _getCategories;

  List<WoCreateComponentModel> _getComponents = [];
  List<WoCreateComponentModel> get getComponents => _getComponents;

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

  final List<String> _getRequestedTypesChildren = [];
  List<String> get getRequestedTypesChildren => _getRequestedTypesChildren;

  final List<String> _getCategoriesChildren = [];
  List<String> get getCategoriesChildren => _getCategoriesChildren;

  final List<String> _getComponentsChildren = [];
  List<String> get getComponentsChildren => _getComponentsChildren;

  final List<String> _getRequestedTypesChildrenTree1 = [];
  List<String> get getRequestedTypesChildrenTree1 => _getRequestedTypesChildrenTree1;

  void setSummary(String newValue) {
    _summary = newValue;
  }

  void setDescription(String newValue) {
    _description = newValue;
  }

  void setRequestedBy(String newValue) {
    _requestedBy = newValue;
    for (var i = 0; i < (_getRequestedBy.length); i++) {
      if (_getRequestedBy[i].username == _requestedBy) {
        _requestedById = _getRequestedBy[i].id.toString();
      }
      notifyListeners();
    }
  }

  void setType(String newValue) {
    _type = newValue;

    for (var i = 0; i < (_getTypes.length); i++) {
      if (_getTypes[i].name == _type) {
        _typesId = _getTypes[i].code.toString();
      }
      notifyListeners();
    }
  }

  void setCategory(String newValue) {
    _category = newValue;
    for (var i = 0; i < (_getCategories.length); i++) {
      if (_getCategories[i].name == _category) {
        _woCategory = _getCategories[i].code.toString();
      }
      notifyListeners();
    }
  }

  void setComponent(String newValue) {
    _component = newValue;
    for (var i = 0; i < (_getComponents.length); i++) {
      if (_getCategories[i].name == _component) {
        _componentKey = _getCategories[i].id.toString();
      }
      notifyListeners();
    }
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
        _requestedId = _woLocationList.children![i].id.toString();
        _requestedLabel = _woLocationList.children![i].labels![0].toString();
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
        _requestedId = _woBlockList.children![i].id.toString();
        _requestedLabel = _woBlockList.children![i].labels![0].toString();
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
        _requestedId = _woFloorList.children![i].id.toString();
        _requestedLabel = _woFloorList.children![i].labels![0].toString();
      }
    }
    lazyList(_buildKey, _lazyType);
    notifyListeners();
  }

  void setSpace(String newValue) {
    _space = newValue;
    for (var i = 0; i < (_woSpaceList.children?.length ?? 0); i++) {
      if (_woSpaceList.children?[i].name == newValue) {
        //_spaceKey = _woSpaceList.children?[i].key ?? '';
        _lazyType = _woSpaceList.children?[i].labels?[0] ?? '';
        _requestedId = _woSpaceList.children![i].id.toString();
        _requestedLabel = _woSpaceList.children![i].labels![0].toString();
      }
    }
    lazyList(_buildKey, _lazyType);
    notifyListeners();
  }

  void setRequestType(String newValue) {
    bool isChildrenExist;
    _requestType = newValue;
    _getRequestedTypesChildrenTree1.clear();
    notifyListeners();
    for (var i = 0; i < (_getRequestedTypes.length); i++) {
      if (_getRequestedTypes[i].name == newValue) {
        isChildrenExist = _getRequestedTypes[i].children!.isNotEmpty ? true : false;
        _requestTypeKey = _getRequestedTypes[i].code.toString();
        _requestedTypeTree1 = !isChildrenExist;
        notifyListeners();
        if (isChildrenExist) {
          for (var b = 0; b < (_getRequestedTypes[i].children!.length); b++) {
            _getRequestedTypesChildrenTree1.add(_getRequestedTypes[i].children![b].name ?? '');
          }
        }
      }
    }
    notifyListeners();
  }

  void setRequestType1(String newValue) {
    bool isChildrenExist;
    _requestType1 = newValue;
    notifyListeners();
    for (var i = 0; i < (_getRequestedTypes.length); i++) {
      if (_getRequestedTypes[i].name == _requestType) {
        for (var b = 0; b < (_getRequestedTypes[i].children!.length); b++) {
          if (_getRequestedTypes[i].children![b].name == _requestType1) {
            _requestTypeKey = _getRequestedTypes[i].children![b].code.toString();
            notifyListeners();
          }
          //_requestTypeKey.add(_getRequestedTypes[i].children![b].name ?? '');
        }
        notifyListeners();
      }
    }
  }

  void getLocation() async {
    _isLoading = true;
    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.getLocation(token);
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
    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.getLazyLoading(token, key);
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
    final token = await SharedManager().getString(SharedEnum.userToken);
    _isLoading = true;

    final response = await _woCreateServiceRepository.getRequestedBy(token);
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
    final token = await SharedManager().getString(SharedEnum.userToken);

    final response = await _woCreateServiceRepository.getType(token);
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
    final token = await SharedManager().getString(SharedEnum.userToken);

    final response = await _woCreateServiceRepository.getRequestedType(token);
    _requestedTypeLoading = false;
    notifyListeners();
    _getRequestedTypesChildren.clear();
    _getRequestedTypes.clear();
    response.fold(
      (l) => {
        _getRequestedTypes = l,
        for (var i = 0; i < (_getRequestedTypes.length); i++)
          {
            _getRequestedTypesChildren.add(_getRequestedTypes[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    notifyListeners();
  }

  void getCategory() async {
    final token = await SharedManager().getString(SharedEnum.userToken);

    final response = await _woCreateServiceRepository.getCategory(token);
    _categoryLoading = false;
    notifyListeners();
    _getCategoriesChildren.clear();
    _getCategories.clear();
    response.fold(
      (l) => {
        _getCategories = l,
        for (var i = 0; i < (_getCategories.length); i++)
          {
            _getCategoriesChildren.add(_getCategories[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    notifyListeners();
  }

  void getComponent() async {
    final token = await SharedManager().getString(SharedEnum.userToken);

    final response = await _woCreateServiceRepository.getComponents(token);
    _componentLoading = false;

    notifyListeners();
    _getComponentsChildren.clear();
    _getComponents.clear();
    response.fold(
      (l) => {
        _getComponents = l,
        for (var i = 0; i < (_getComponents.length); i++)
          {
            _getComponentsChildren.add(_getComponents[i].name ?? ''),
            notifyListeners(),
          }
      },
      (r) => {},
    );
    notifyListeners();
  }

  void createTask() async {
    final token = await SharedManager().getString(SharedEnum.userToken);
    _isLoading = true;
    notifyListeners();

    final String appointmendData = '$_date $_hour:00';

    final response = await _woCreateServiceRepository.createTask(
        token, summary, _requestTypeKey, requestedById, description, appointmendData, typesId, requestedId, requestedLabel, woCategory, componentKey);

    response.fold(
      (l) => {
        _isWorkOrderCreate = true,
        notifyListeners(),
      },
      (r) => {
        _isWorkOrderCreate = false,
      },
    );
    _isLoading = false;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _isWorkOrderCreate = false;
      notifyListeners();
    });
  }
}
