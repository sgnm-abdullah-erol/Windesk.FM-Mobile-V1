import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space_created_by.dart';
import 'work_space_priority.dart';
part 'generator/work_space_task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  final String? owner;
  final bool? canDisplay;
  final DateTime? dueDate;
  final String? description;
  final bool? isActive;
  final String? trId;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final DateTime? appointmentDate;
  final String? key;
  final DateTime? updatedAt;
  final int? id;
  final List<String>? labels;
  final String? templatedBy;
  final CreatedBy? requestedBy;
  final CreatedBy? requestedSpaces;
  final CreatedBy? createdBy;
  final Priority? woCategory;
  final Priority? requestType;
  final Priority? priority;
  final String? userFirstNameLastName;
  final String? user;
  final String? userId;

  const Task(
    this.woCategory, {
    this.owner,
    this.canDisplay,
    this.dueDate,
    this.description,
    this.isActive,
    this.trId,
    this.createdAt,
    this.isDeleted,
    this.name,
    this.canDelete,
    this.appointmentDate,
    this.key,
    this.updatedAt,
    this.id,
    this.labels,
    this.templatedBy,
    this.requestedBy,
    this.requestedSpaces,
    this.createdBy,
    this.requestType,
    this.priority,
    this.userFirstNameLastName,
    this.user,
    this.userId,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  List<Object?> get props => [
        owner,
        canDisplay,
        dueDate,
        description,
        isActive,
        trId,
        createdAt,
        isDeleted,
        name,
        canDelete,
        appointmentDate,
        key,
        updatedAt,
        id,
        labels,
        templatedBy,
        requestedBy,
        requestedSpaces,
        createdBy,
        requestType,
        priority,
        userFirstNameLastName,
        user,
        userId,
      ];
}
