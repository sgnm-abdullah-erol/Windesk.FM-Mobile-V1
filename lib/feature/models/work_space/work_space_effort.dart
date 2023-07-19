import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_effort_value.dart';
part 'generator/work_space_effort.g.dart';

@JsonSerializable()
class WorkSpaceEffort extends Equatable {
  final int? id;
  final List<String>? label;
  final WorkSpaceEffortValue? value;

  const WorkSpaceEffort({
    this.id,
    this.label,
    this.value,
  });

  factory WorkSpaceEffort.fromJson(Map<String, dynamic> json) => _$WorkSpaceEffortFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceEffortToJson(this);

  @override
  List<Object?> get props => [
        id,
        label,
        value,
      ];
}
