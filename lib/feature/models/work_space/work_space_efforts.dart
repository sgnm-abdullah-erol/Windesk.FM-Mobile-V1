import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_efforts.g.dart';

@JsonSerializable()
class WorkSpaceEfforts extends Equatable {
  final int? id;
  final List<String>? label;
  final String? startDate;
  final String? endDate;
  final String? effortDuration;
  final String? description;
  final String? effortType;
  final String? user;

  const WorkSpaceEfforts({
    this.id,
    this.label,
    this.startDate,
    this.endDate,
    this.effortDuration,
    this.description,
    this.effortType,
    this.user,
  });

  factory WorkSpaceEfforts.fromJson(Map<String, dynamic> json) => _$WorkSpaceEffortsFromJson(json);

  static List<WorkSpaceEfforts> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkSpaceEfforts.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => _$WorkSpaceEffortsToJson(this);

  @override
  List<Object?> get props => [
        id,
        label,
        startDate,
        endDate,
        effortDuration,
        description,
        effortType,
        user,
      ];
}
