// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['woCategory'] == null
          ? null
          : Priority.fromJson(json['woCategory'] as Map<String, dynamic>),
      owner: json['owner'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      appointmentDate: json['appointmentDate'] as String?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      templatedBy: json['templatedBy'] as String?,
      requestedBy: json['requestedBy'] == null
          ? null
          : CreatedBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      requestedSpaces: json['requestedSpaces'] == null
          ? null
          : CreatedBy.fromJson(json['requestedSpaces'] as Map<String, dynamic>),
      requestedComponents: json['requestedComponents'] == null
          ? null
          : CreatedBy.fromJson(
              json['requestedComponents'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      requestType: json['requestType'] == null
          ? null
          : Priority.fromJson(json['requestType'] as Map<String, dynamic>),
      priority: json['priority'] == null
          ? null
          : Priority.fromJson(json['priority'] as Map<String, dynamic>),
      userFirstNameLastName: json['userFirstNameLastName'] as String?,
      user: json['user'] as String?,
      userId: json['userId'] as String?,
      depended_on: json['depended_on'] as int?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'owner': instance.owner,
      'canDisplay': instance.canDisplay,
      'dueDate': instance.dueDate?.toIso8601String(),
      'description': instance.description,
      'isActive': instance.isActive,
      'trId': instance.trId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'appointmentDate': instance.appointmentDate,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'labels': instance.labels,
      'templatedBy': instance.templatedBy,
      'depended_on': instance.depended_on,
      'requestedBy': instance.requestedBy,
      'requestedSpaces': instance.requestedSpaces,
      'requestedComponents': instance.requestedComponents,
      'createdBy': instance.createdBy,
      'woCategory': instance.woCategory,
      'requestType': instance.requestType,
      'priority': instance.priority,
      'userFirstNameLastName': instance.userFirstNameLastName,
      'user': instance.user,
      'userId': instance.userId,
    };
