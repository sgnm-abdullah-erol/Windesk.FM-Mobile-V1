import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_effort_value.g.dart';

@JsonSerializable()
class WorkSpaceEffortValue extends Equatable {
  final String? startDate;
  final String? endDate;
  final String? effortDuration;
  final String? description;
  final String? effortType;
  final String? user;

  const WorkSpaceEffortValue({
    this.startDate,
    this.endDate,
    this.effortDuration,
    this.description,
    this.effortType,
    this.user,
  });

  factory WorkSpaceEffortValue.fromJson(Map<String, dynamic> json) => _$WorkSpaceEffortValueFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceEffortValueToJson(this);

  @override
  List<Object?> get props => [
        startDate,
        endDate,
        effortDuration,
        description,
        effortType,
        user,
      ];
}
