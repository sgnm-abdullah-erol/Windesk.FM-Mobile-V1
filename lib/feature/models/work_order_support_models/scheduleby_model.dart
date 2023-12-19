import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/parent_schedule_model.dart';

part 'generator_work_order_support_model/scheduleby_model.g.dart';

@JsonSerializable()
class SchedulebyModel extends Equatable {
  final List<ParentScheduleModel>? parentSchedule;

  const SchedulebyModel({
    this.parentSchedule,
  });

  factory SchedulebyModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulebyModelFromJson(json);

  static List<SchedulebyModel> fromJsonList(List<dynamic> json) {
    List<SchedulebyModel> schedulebyModel = [];

    for (var item in json) {
      schedulebyModel.add(SchedulebyModel.fromJson(item));
    }

    return schedulebyModel;
  }

  Map<String, dynamic> toJson() => _$SchedulebyModelToJson(this);

  @override
  List<Object?> get props => [
        parentSchedule,
      ];
}
