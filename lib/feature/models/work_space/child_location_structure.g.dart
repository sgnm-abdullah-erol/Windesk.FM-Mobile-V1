// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_location_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildLocationStructure _$ChildLocationStructureFromJson(
        Map<String, dynamic> json) =>
    ChildLocationStructure(
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      owner: json['owner'] as String?,
      contractor: json['contractor'] as String?,
      phase: json['phase'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      address: json['address'] as String?,
      warrantyExpireDate: json['warrantyExpireDate'] as int?,
      description: json['description'] as String?,
      siteName: json['siteName'] as String?,
      siteDescription: json['siteDescription'] as String?,
      areaMeasurement: json['areaMeasurement'] as int?,
      nodeType: json['nodeType'] as String?,
      isActive: json['isActive'] as bool?,
      childOperator: json['childOperator'] as String?,
      handoverDate: json['handoverDate'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      operationStartDate: json['operationStartDate'] as int?,
      name: json['name'] as String?,
      projectDescription: json['projectDescription'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      projectName: json['projectName'] as String?,
      key: json['key'] as String?,
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
    );

Map<String, dynamic> _$ChildLocationStructureToJson(
        ChildLocationStructure instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'owner': instance.owner,
      'contractor': instance.contractor,
      'phase': instance.phase,
      'canDisplay': instance.canDisplay,
      'address': instance.address,
      'warrantyExpireDate': instance.warrantyExpireDate,
      'description': instance.description,
      'siteName': instance.siteName,
      'siteDescription': instance.siteDescription,
      'areaMeasurement': instance.areaMeasurement,
      'nodeType': instance.nodeType,
      'isActive': instance.isActive,
      'childOperator': instance.childOperator,
      'handoverDate': instance.handoverDate,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'operationStartDate': instance.operationStartDate,
      'name': instance.name,
      'projectDescription': instance.projectDescription,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'projectName': instance.projectName,
      'key': instance.key,
      'id': instance.id,
      'leaf': instance.leaf,
    };
