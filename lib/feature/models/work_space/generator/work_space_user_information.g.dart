// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceUserInformation _$WorkSpaceUserInformationFromJson(Map<String, dynamic> json) => WorkSpaceUserInformation(
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      urlType: json['urlType'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      referenceLabel: (json['referenceLabel'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      url: json['url'] as String?,
      referenceId: json['referenceId'] as String?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WorkSpaceUserInformationToJson(WorkSpaceUserInformation instance) => <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'urlType': instance.urlType,
      'isDeleted': instance.isDeleted,
      'referenceLabel': instance.referenceLabel,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'url': instance.url,
      'referenceId': instance.referenceId,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
