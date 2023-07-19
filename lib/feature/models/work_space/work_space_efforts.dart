import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_created_by.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_effort.dart';

part 'generator/work_space_efforts.g.dart';

@JsonSerializable()
class WorkSpaceEfforts extends Equatable {
  final List<CreatedBy>? requestedBy;
  final List<CreatedBy>? requestedSpaces;
  final List<CreatedBy>? createdBy;
  final List<WorkSpaceEffort>? effort;
  final String? templatedBy;
  final String? woCategory;
  final String? woCategoryName;
  final String? requestType;
  final String? requestTypeName;
  final String? priority;
  final String? priorityName;
  final DateTime? appointmentDate;
  final String? description;
  final DateTime? dueDate;
  final String? name;
  final String? templatedByName;

  const WorkSpaceEfforts({
    this.requestedBy,
    this.requestedSpaces,
    this.createdBy,
    this.effort,
    this.templatedBy,
    this.woCategory,
    this.woCategoryName,
    this.requestType,
    this.requestTypeName,
    this.priority,
    this.priorityName,
    this.appointmentDate,
    this.description,
    this.dueDate,
    this.name,
    this.templatedByName,
  });

  factory WorkSpaceEfforts.fromJson(Map<String, dynamic> json) => _$WorkSpaceEffortsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceEffortsToJson(this);

  @override
  List<Object?> get props => [
        requestedBy,
        requestedSpaces,
        createdBy,
        effort,
        templatedBy,
        woCategory,
        woCategoryName,
        requestType,
        requestTypeName,
        priority,
        priorityName,
        appointmentDate,
        description,
        dueDate,
        name,
        templatedByName,
      ];
}
