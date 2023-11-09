import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/feature/models/work_space/child_location_structure.dart';
import 'package:vm_fm_4/feature/models/work_space/main_location_structure.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/new_order/service/wo_create_service_repository_impl.dart';

class LeafLocationProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();
  final WoCreateServiceRepositoryImpl _woCreateServiceRepository = Injection.getIt.get<WoCreateServiceRepositoryImpl>();

  late final MainLocationStructure structure;
  TreeNodeData root = TreeNodeData(
    title: 'Root',
    expaned: false,
    checked: true,
    children: [],
    extra: null,
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool initState = true;
  bool locationLoading = true;

  bool _changeLocationSuccess = false;
  bool get changeLocationSucces => _changeLocationSuccess;

  bool _lazyLoading = true;
  bool get lazyLoading => locationLoading;

  bool _locationLeaf = true;
  bool get locationLeaf => _locationLeaf;

  bool _buildingLeaf = true;
  bool get buildingLeaf => _buildingLeaf;

  bool _floorLeaf = true;
  bool get floorLeaf => _floorLeaf;

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

  String _requestedId = '';
  String get requestedId => _requestedId;

  String _requestedLabel = '';
  String get requestedLabel => _requestedLabel;

  String _selectedLocationName = '';
  String get selectedLocationName => _selectedLocationName;

  String _locationKey = '';
  String _buildKey = '';
  String _floorKey = '';
  String _lazyType = '';

  WoCreateLocationModel _woLocationList = const WoCreateLocationModel();
  WoCreateLocationModel get woLocationList => _woLocationList;

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

  void getMainStructure() async {
    if (initState) {
      _isLoading = true;
      initState = false;
      notifyListeners();

      String userToken = await SharedManager().getString(SharedEnum.userToken);
      structure = await workSpaceService.getMainLocationStructure(userToken);

      root = TreeNodeData(
        title: structure.name ?? '',
        expaned: true,
        checked: false,
        children: [],
        extra: '${structure.children?.first.key ?? ''}!!!!${structure.children?.first.labels?.first ?? ''}',
      );

      _isLoading = false;
      notifyListeners();
    }
  }

  void getLocation() async {
    _selectedLocationName = '';
    _isLoading = true;
    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.getLocation(token);
    locationLoading = false;
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

  void setLocation(String newValue) {
    woBlockListChildren.clear();
    woFloorListChildren.clear();
    _location = newValue;
    for (var i = 0; i < (_woLocationList.children?.length ?? 0); i++) {
      if (_woLocationList.children?[i].name == newValue) {
        _selectedLocationName = newValue;
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
        _selectedLocationName = newValue;
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
        _selectedLocationName = newValue;
        _floorKey = _woFloorList.children?[i].key ?? '';
        _lazyType = _woFloorList.children?[i].labels?[0] ?? '';
        _floorLeaf = _woFloorList.children?[i].leaf ?? true;
        _requestedId = _woFloorList.children![i].id.toString();
        _requestedLabel = _woFloorList.children![i].labels![0].toString();
      }
    }
    lazyList(_floorKey, _lazyType);
    notifyListeners();
  }

  void setSpace(String newValue) {
    _space = newValue;
    for (var i = 0; i < (_woSpaceList.children?.length ?? 0); i++) {
      if ('${_woSpaceList.children?[i].code}-${_woSpaceList.children?[i].name}' == newValue) {
        //_spaceKey = _woSpaceList.children?[i].key ?? '';
        _selectedLocationName = newValue;
        _lazyType = _woSpaceList.children?[i].labels?[0] ?? '';
        _requestedId = _woSpaceList.children?[i].id.toString() ?? '';
        _requestedLabel = _woSpaceList.children?[i].labels?[0].toString() ?? '';
      }
    }
    //lazyList(_buildKey, _lazyType);
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
              _woSpaceListChildren.add('${_woSpaceList.children?[i].code}-${_woSpaceList.children?[i].name}'),
            }
        },
        (r) => {},
      );
    }
    notifyListeners();
  }

  void changeLocation(String taskId, String templatedBy, String dependedOn,BuildContext context) async {
    _isLoading = true;
    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await _woCreateServiceRepository.updateTask(token, taskId, requestedId, requestedLabel, templatedBy, dependedOn);
    locationLoading = false;
    notifyListeners();
    _woLocationListChildren.clear();
    response.fold(
      (l) => {
        _changeLocationSuccess = true,
        snackBar(context, LocaleKeys.LocationChangeSuccessfull.tr(), 'success'),
        Navigator.of(context).pop<bool>(true),
      },
      (r) => {
        snackBar(context, LocaleKeys.Active, 'success'),

      },
    );
    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      _changeLocationSuccess = false;
    });
  }

  Future<List<TreeNodeData>> load(TreeNodeData parent) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final data = await workSpaceService.getChildLocationStructure(userToken, parent.extra?.split('!!!!')[0], parent.extra?.split('!!!!')[1]);

    List<TreeNodeData> treeNodes = [];
    List<ChildLocationStructure> children = data;

    for (var i = 0; i < children.length; i++) {
      treeNodes.add(
        TreeNodeData(
          title: children[i].name ?? '',
          expaned: false,
          checked: false,
          children: [],
          extra: '${children[i].key ?? ''}!!!!${children[i].labels?.first ?? ''}',
        ),
      );
    }

    return treeNodes;
  }
}
