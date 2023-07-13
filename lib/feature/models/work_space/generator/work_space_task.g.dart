// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      owner: json['owner'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      dueDate: json['dueDate'] == null ? null : DateTime.parse(json['dueDate'] as String),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      appointmentDate: json['appointmentDate'] == null ? null : DateTime.parse(json['appointmentDate'] as String),
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      templatedBy: json['templatedBy'] as String?,
      requestedBy: json['requestedBy'] == null ? null : CreatedBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      requestedSpaces: json['requestedSpaces'] == null ? null : CreatedBy.fromJson(json['requestedSpaces'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null ? null : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      requestType: json['requestType'] == null ? null : Priority.fromJson(json['requestType'] as Map<String, dynamic>),
      priority: json['priority'] == null ? null : Priority.fromJson(json['priority'] as Map<String, dynamic>),
      userFirstNameLastName: json['user_firstName_lastName'] as String?,
      user: json['user'] as String?,
      userId: json['userId'] as String?,
    );
