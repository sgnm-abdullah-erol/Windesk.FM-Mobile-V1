import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/enums/service_response_status_enums.dart';
import '../../../../core/enums/service_status_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/work_order_models/work_order_added_resources_model.dart';
import '../../../models/work_order_models/work_order_attachments_model.dart';
import '../../../models/work_order_models/work_order_date_action_model.dart';
import '../../../models/work_order_models/work_order_details_model.dart';
import '../../../models/work_order_models/work_order_loads_model.dart';
import '../../../models/work_order_models/work_order_resources_model.dart';
import '../../../models/work_order_models/work_order_shiftings_model.dart';
import '../../../models/work_order_models/work_order_spareparts_model.dart';
import '../../../models/work_order_models/work_order_stores_model.dart';
import 'work_order_service_repository.dart';

class WorkOrderServiceRepositoryImpl extends WorkOrderServiceRepository {
  // GET SERVICES
  @override
  Future<Either<List<WorkOrderLoadsModel>, CustomServiceException>> getWorkOrderLoads(String workOrderCode) async {
    List<WorkOrderLoadsModel> loads = [];
    String url = 'http://windeskmobile.signumtte.com/workorder/$workOrderCode/workloads';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1040", 'xtoken': 'demo!'},
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        loads = const WorkOrderLoadsModel().fromJsonList(data);

        return Left(loads);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderAttachmentsModel>, CustomServiceException>> getWorkOrderAttachments(String workOrderCode) async {
    List<WorkOrderAttachmentsModel> attachments = [];
    String url = 'http://windeskmobile.signumtte.com/workorder/$workOrderCode/attachments';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1040", 'xtoken': 'demo!'},
          ));
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        attachments = const WorkOrderAttachmentsModel().fromJsonList(data);

        return Left(attachments);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAttachmentsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAttachmentsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderResourcesModel>, CustomServiceException>> getWorkOrderResources(String workOrderCode) async {
    List<WorkOrderResourcesModel> resources = [];
    String url = 'http://windeskmobile.signumtte.com/workorder/$workOrderCode/resources';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1040", 'xtoken': 'demo!'},
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        resources = WorkOrderResourcesModel.fromJsonList(data);
        return Left(resources);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderResourcesError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderResourcesError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderShiftingsModel>, CustomServiceException>> getWorkOrderShiftings() async {
    List<WorkOrderShiftingsModel> shiftings = [];

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=getVardiyas';
    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        super.logger.e(shiftings.toString());

        shiftings = WorkOrderShiftingsModel.fromJsonList(data);

        return Left(shiftings);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderShiftingsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderShiftingsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkOrderDetailsModel, CustomServiceException>> getWorkOrderDetails(String workOrderCode) async {
    WorkOrderDetailsModel workOrderDeatails;
    String url = 'http://windeskmobile.signumtte.com/workorder/detail/$workOrderCode';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {
              'xusercode': "sgnm1040",
              'xtoken': 'demo!',
            },
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.detail.rawText];
        workOrderDeatails = WorkOrderDetailsModel.fromJson(data);

        super.logger.d(workOrderDeatails.toString());

        return Left(workOrderDeatails);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDetailsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDetailsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderSparepartsModel>, CustomServiceException>> getWorkOrderSpareparts(String workOrderCode) async {
    List<WorkOrderSparepartsModel> spareparts = [];
    String url = 'http://windeskmobile.signumtte.com/workorder/$workOrderCode/spareparts';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1040", 'xtoken': 'demo!'},
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        spareparts = WorkOrderSparepartsModel.fromJsonList(data);

        return Left(spareparts);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderSparepartsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderSparepartsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkOrderDateActionModel, CustomServiceException>> getWorkOrderDateAction(String workOrderCode, String actionType) async {
    WorkOrderDateActionModel dateAction;
    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=workorderActualDateActions&workorderCode=$workOrderCode&username=sgnm1040&type=$actionType&nfc=0&workorder_wait_reason=&workorder_wait_reasoncode=';
    try {
      final response = await super.dio.get(url);
      if (response.statusCode == 200) {
        dateAction = WorkOrderDateActionModel.fromJson(response.data);

        return Left(dateAction);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDateActionError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDateActionError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderStores>, CustomServiceException>> getWorkOrderStores() async {
    List<WorkOrderStores> stores;
    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=getStore&user=sgnm1040';
    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        stores = WorkOrderStores.fromJsonList(data);

        return Left(stores);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderAddedResources>, CustomServiceException>> getWorkOrderAddedResources(String serviceCode) async {
    List<WorkOrderAddedResources> addedResources;
    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=getResponsible&service=$serviceCode';
    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        addedResources = WorkOrderAddedResources.fromJsonList(data);

        return Left(addedResources);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddedResourcesError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddedResourcesError, statusCode: '500'));
    }
  }

  // ADD SERVICES
  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(String workOrderCode, String workPeriod) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=addWorkorderEffort&workordercode=wo00002986&username=sgnm1040&module=workorder&workperiod=000010000&startdate=1&type=PREDICTED&description=test';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderImage(String workOrderCode, String image, String desc) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=addAttachment&username=sgnm1040&moduleName=workorder&issueCode=wo00002986';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderPersonal(String workOrderCode, String moduleCode, String tuwnofWork) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=addResourceStaff&module=xusr&modulecode=K200462&workordercode=wo00002986&turnofwork=V00000001';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderSpareparts(String workOrderCode, String product, String amount, String unit) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_6BCFD9E7-75A8-4688-8E85-10C5E2B4A96E&action=addMaterial&module=stproductdef&modulecode=S00000000002067&workordercode=MYM_WO00000551&amount=12&unit=PCK0000010893';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddSparepartsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddSparepartsError, statusCode: '500'));
    }
  }

  // DELETE SERVICES
  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderEffort(String workOrderCode) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=deleteWorkorderWorklog&code=WL00000261&username=sgnm1040';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteEffortError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteEffortError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderPersonal(String workOrderCode, String moduleCode) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=deleteWorkorderResource&username=sgnm1040&module=xusr&moduleCode=K200462&workorderCode=wo00002986';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeletePersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeletePersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderSpareparts(String workOrderCode) async {
    bool result = false;

    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=deleteWorkorderSparepart&code=malzeme kod&username=sgnm1040';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(
          CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: response.statusCode.toString()),
        );
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: '500'));
    }
  }
}
