import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space.dart';
import 'work_space_calendar.dart';
import 'work_space_total_count.dart';
import 'work_space_user_information.dart';

@JsonSerializable()
class WorkSpaceAppendings extends Equatable {
  final Workspace? workspace;
  final Task? task;
  final State? state;
  final Calendar? calendar;
  final TotalCount? totalCount;
  final WorkSpaceUserInformation? workSpaceUserInformation;

  const WorkSpaceAppendings(
    this.workspace,
    this.task,
    this.state,
    this.calendar,
    this.totalCount,
    this.workSpaceUserInformation,
  );

  // factory WorkSpaceAppendings.fromJson(Map<String, dynamic> json) => _$WorkSpaceAppendingsFromJson(json);

  // Map<String, dynamic> toJson() => _$WorkSpaceAppendingsToJson(this);

  @override
  List<Object?> get props => [
        workspace,
        task,
        state,
        calendar,
        totalCount,
        workSpaceUserInformation,
      ];
}
