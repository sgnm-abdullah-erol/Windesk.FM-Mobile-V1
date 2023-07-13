import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderListProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  final WorkSpaceServiceRepositoryImpl workSpaceService = WorkSpaceServiceRepositoryImpl();

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isMyWorkOrdersDataFetched = false;
  bool get isMyWorkOrdersDataFetched => _isMyWorkOrdersDataFetched;

  bool _isMyGroupWorkOrdersDataFetched = false;
  bool get isMyGroupWorkOrdersDataFetched => _isMyGroupWorkOrdersDataFetched;

  bool _isMyPendikWorkOrdersDataFetched = false;
  bool get isMyPendikWorkOrdersDataFetched => _isMyPendikWorkOrdersDataFetched;

  List<WorkSpaceDetail> _myWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myWorkSpaceDetails => _myWorkSpaceDetails;

  void getMyWorkOrders() async {
    if (_isMyWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getMyWorkSpaces(
        'swagger',
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyWHlXNldXZEk5UUt1Q25hcWJzcnVWeG8zZ0xJa2R6TWd0ZlNIeVpybWIwIn0.eyJleHAiOjE2OTAxMTU0MzcsImlhdCI6MTY4OTI1MTQzNywianRpIjoiZTA0YTdjNjYtMDFkMS00ZGRlLWEwYTUtZjMyODJiZTk3YWY5IiwiaXNzIjoiaHR0cDovLzE3Mi4zMC45OS4xMjE6ODA4MC9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiNGFkY2NhODYtMzk4MS00MDE2LTk0MjEtMmJhYWVhY2M1MThmIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiIxMjJiZTgxNi0zYTRjLTQ2MGQtOGYxNC0wODRkZTEwZTJhNDciLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJ2aWV3LWlkZW50aXR5LXByb3ZpZGVycyIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsiam9pbnRzcGFjZV91cGRhdGUiLCJzeXN0ZW1fY3JlYXRlIiwidXNlcl9kZWxldGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwiam9pbnRzcGFjZV92aWV3IiwidXNlcl91cGRhdGUiLCJ2aWV3X3NhcCIsImNvbnRhY3RfdXBkYXRlIiwiem9uZV9jcmVhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ6b25lX3ZpZXciLCJ3b3Jrc3BhY2VfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiZmFjaWxpdHlfY2xpZW50X3JvbGVfYWRtaW4iLCJjb21wb25lbnRfY3JlYXRlIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0Iiwid29ya3NwYWNlX2NyZWF0ZSIsImNvbXBvbmVudF9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJ3b3JrZmxvd192aWV3Iiwic3RydWN0dXJlX3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJjbGFzc2lmaWNhdGlvbl91cGRhdGUiLCJ1bWFfcHJvdGVjdGlvbiIsInN0cnVjdHVyZV9jcmVhdGUiLCJncm91cF91cGRhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJ1c2VyX2NyZWF0ZSIsInR5cGVfZXhwb3J0Iiwiem9uZV9kZWxldGUiLCJjb21wb25lbnRfZGVsZXRlIiwiZ3JvdXBfY3JlYXRlIiwid29ya2Zsb3dfY3JlYXRlIiwic3RydWN0dXJlLWFzc2V0LXZpZXciLCJkZWxldGVfc2FwIiwieXlzX3ZpZXciLCJjbGFzc2lmaWNhdGlvbl9jcmVhdGUiLCJzeXN0ZW1fdXBkYXRlIiwidHlwZV92aWV3Il19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsImRlbGV0ZS1hY2NvdW50IiwibWFuYWdlLWNvbnNlbnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiIxMjJiZTgxNi0zYTRjLTQ2MGQtOGYxNC0wODRkZTEwZTJhNDciLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiLEsHNtZXQgQXRhbWVyIEF0YWxheSIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IsSwc21ldCBBdGFtZXIiLCJsb2NhbGUiOiJ0ciIsImZhbWlseV9uYW1lIjoiQXRhbGF5In0.U7yYsaLHtIkXdGMcpfKjYNixu9z0O4e1ssM-rC16-B2OzFGR0xkoDRlsV5plfFq7vIPClYazkD8brphpEibEegn6KovSxqBSi8H6PR8txuXPtR8AIApe5IOfz6_lg50WAq7XWQDPA_jN0p-HgTr9OJYPVkmhE7bYHh7uIULcgX1-tEjZLugJDc2zWAHO_7Q2aJOsooE02ALLfqIhWNaLqgi7Jxy4Rs-0QDL37QXFuJMYlYBl9UG5JG_mHhNbKEgDhWVEDMAn_6jfKgfCIgHICsLIiriXgpukBf1mMt0rNQyVMVASIUV6xYA_gG4pMSM_DgVPcuhQtbADx3HKIA5O2g',
        1);

    result.fold((l) {
      _myWorkSpaceDetails = l;
    }, (r) {});

    print(_myWorkSpaceDetails);
    _isMyWorkOrdersDataFetched = true;
    _isLoading = false;
    notifyListeners();
  }

  void getMyGroupWorkOrders() {
    if (_isMyGroupWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isMyGroupWorkOrdersDataFetched = true;
      _isLoading = false;
      notifyListeners();
    });
  }

  void getMyPendikWorkOrders() {
    if (_isMyPendikWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isMyPendikWorkOrdersDataFetched = true;
      _isLoading = false;
      notifyListeners();
    });
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        _tabIndex = 0;
        break;
      case 1:
        _tabIndex = 1;
        break;
      case 2:
        _tabIndex = 2;
        break;
    }
    notifyListeners();
  }
}
