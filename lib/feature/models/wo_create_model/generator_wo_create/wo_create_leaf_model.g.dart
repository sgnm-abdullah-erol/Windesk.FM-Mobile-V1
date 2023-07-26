// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_leaf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateLeafModel _$WoCreateLeafModelFromJson(Map<String, dynamic> json) =>
    WoCreateLeafModel(
      contractor: json['contractor'] as String?,
      code: json['code'] as String?,
      externalSiteObject: json['externalSiteObject'] as String?,
      warrantyExpireDate: json['warrantyExpireDate'] as String?,
      externalFacilityObject: json['externalFacilityObject'] as String?,
      description: json['description'] as String?,
      siteName: json['siteName'] as String?,
      isActive: json['isActive'] as bool?,
      temperaturesOperator: json['temperaturesOperator'] as String?,
      handoverDate: json['handoverDate'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      operationStartDate: json['operationStartDate'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      externalFacilityIdentifier: json['externalFacilityIdentifier'] as String?,
      key: json['key'] as String?,
      owner: json['owner'] as String?,
      phase: json['phase'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      address: json['address'] as String?,
      siteDescription: json['siteDescription'] as String?,
      areaMeasurement: json['areaMeasurement'] as String?,
      nodeType: json['nodeType'] as String?,
      externalSystem: json['externalSystem'] as String?,
      externalObject: json['externalObject'] as String?,
      name: json['name'] as String?,
      projectDescription: json['projectDescription'] as String?,
      projectName: json['projectName'] as String?,
      externalSiteIdentifier: json['externalSiteIdentifier'] as String?,
      status: json['status'] as String?,
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              WoCreateLeafChildrenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WoCreateLeafModelToJson(WoCreateLeafModel instance) =>
    <String, dynamic>{
      'contractor': instance.contractor,
      'code': instance.code,
      'externalSiteObject': instance.externalSiteObject,
      'warrantyExpireDate': instance.warrantyExpireDate,
      'externalFacilityObject': instance.externalFacilityObject,
      'description': instance.description,
      'siteName': instance.siteName,
      'isActive': instance.isActive,
      'temperaturesOperator': instance.temperaturesOperator,
      'handoverDate': instance.handoverDate,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'operationStartDate': instance.operationStartDate,
      'externalIdentifier': instance.externalIdentifier,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'externalFacilityIdentifier': instance.externalFacilityIdentifier,
      'key': instance.key,
      'owner': instance.owner,
      'phase': instance.phase,
      'canDisplay': instance.canDisplay,
      'address': instance.address,
      'siteDescription': instance.siteDescription,
      'areaMeasurement': instance.areaMeasurement,
      'nodeType': instance.nodeType,
      'externalSystem': instance.externalSystem,
      'externalObject': instance.externalObject,
      'name': instance.name,
      'projectDescription': instance.projectDescription,
      'projectName': instance.projectName,
      'externalSiteIdentifier': instance.externalSiteIdentifier,
      'status': instance.status,
      'id': instance.id,
      'leaf': instance.leaf,
      'children': instance.children,
    };
