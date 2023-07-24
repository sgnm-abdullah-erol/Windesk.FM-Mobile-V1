import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space.dart';
import 'work_space_calendar.dart';
import 'work_space_state.dart';
import 'work_space_task.dart';
import 'work_space_total_count.dart';
import 'work_space_user_information.dart';

part '../work_order_models/generator_work_order/work_space_appendings.g.dart';

@JsonSerializable()
class WorkSpacePendiks extends Equatable {
  final Workspace? workspace;
  final Task? task;
  final State? state;
  final Calendar? calendar;
  final TotalCount? totalCount;
  final WorkSpaceUserInformation? workSpaceUserInformation;

  const WorkSpacePendiks(
    this.workspace,
    this.task,
    this.state,
    this.calendar,
    this.totalCount,
    this.workSpaceUserInformation,
  );

  factory WorkSpacePendiks.fromJson(Map<String, dynamic> json) => _$WorkSpaceAppendingsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceAppendingsToJson(this);

  static List<WorkSpacePendiks> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkSpacePendiks.fromJson(json)).toList();
  }

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
