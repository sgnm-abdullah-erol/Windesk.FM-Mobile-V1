import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space.dart';
import 'work_space_calendar.dart';
import 'work_space_state.dart';
import 'work_space_task.dart';
import 'work_space_total_count.dart';

part 'generator/work_space_detail.g.dart';

@JsonSerializable()
class WorkSpaceDetail extends Equatable {
  final Workspace? workspace;
  final Task? task;
  final State? state;
  final Calendar? calendar;
  final TotalCount? totalCount;

  const WorkSpaceDetail({
    this.workspace,
    this.task,
    this.state,
    this.calendar,
    this.totalCount,
  });

  factory WorkSpaceDetail.fromJson(Map<String, dynamic> json) => _$WorkSpaceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceDetailToJson(this);

  static List<WorkSpaceDetail> fromJsonList(List<dynamic> jsonList) {
    List<WorkSpaceDetail> workSpaceDetail = [];
    for (var json in jsonList) {
      workSpaceDetail.add(WorkSpaceDetail.fromJson(json));
    }
    return workSpaceDetail;
  }

  @override
  List<Object?> get props => [
        workspace,
        task,
        state,
        calendar,
        totalCount,
      ];
}
