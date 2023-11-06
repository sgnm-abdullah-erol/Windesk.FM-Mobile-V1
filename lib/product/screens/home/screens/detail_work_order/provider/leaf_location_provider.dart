import 'package:flutter/material.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/work_space/child_location_structure.dart';
import 'package:vm_fm_4/feature/models/work_space/main_location_structure.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class LeafLocationProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();
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
